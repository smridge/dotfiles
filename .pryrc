# frozen_string_literal: true

require "erb"

include ERB::Util
extend Rails::ConsoleMethods if defined?(Rails) && Rails.env && Rails.root

alias q exit

Pry.config.pager = false

if File.exist?(File.join(Dir.home, ".local.pryrc.rb"))
  Pry.toplevel_binding.eval(File.read(File.join(Dir.home, ".local.pryrc.rb")))
end

# https://github.com/deivid-rodriguez/pry-byebug
if defined?(PryByebug)
  Pry.commands.alias_command "s", "step"
  Pry.commands.alias_command "n", "next"
  Pry.commands.alias_command "f", "finish"
  Pry.commands.alias_command "c", "continue"
  Pry.commands.alias_command "regroup", "whereami"
  Pry.commands.alias_command "trace", "wtf?"
end

if Pry::Prompt.respond_to?(:new)
  Pry.config.prompt = Pry::Prompt.new(
    "rails",
    "custom prompt",
    [proc { |obj, nest_level, _| "[#{app_name}][#{formatted_env}] #{obj}:#{nest_level}#{Pry::Helpers::Text.green(">")} " }]
  )
else
  Pry.config.prompt = proc { |obj, nest_level, _| "[#{app_name}][#{formatted_env}] #{obj}:#{nest_level}#{Pry::Helpers::Text.green(">")} " }
end

def app_name
  name = Pry::Helpers::Text.bold(File.basename(Dir.getwd))
  Pry::Helpers::Text.cyan(name)
end

def formatted_env
  return Pry::Helpers::Text.green(Pry::Helpers::Text.bold("pry")) unless defined?(Rails)

  case Rails.env
  when "production"
    bold_upcased_env = Pry::Helpers::Text.bold(Rails.env.upcase)
    Pry::Helpers::Text.red(bold_upcased_env)
  when "staging"
    Pry::Helpers::Text.yellow(Rails.env)
  when "development"
    Pry::Helpers::Text.green(Rails.env)
  else
    Rails.env
  end
end

def time times = 1
  require "benchmark"

  ret = nil
  Benchmark.bm { |x| x.report { times.times { ret = yield } } }
  ret
end

def klass_methods klass
  klass.public_instance_methods - Object.public_instance_methods
end

def tables
  ActiveRecord::Base.connection.tables.sort
end

def column_data_type data_type
  query =
    <<-SQL
      select
        table_name,
        column_name,
        data_type
      from information_schema.columns
      where data_type in ('#{data_type}')
      order by table_name
    SQL

  ActiveRecord::Base.connection.exec_query(query)
end

def pg_version
  ActiveRecord::Base.connection.select_value('select version()')
end

def pg_exts
  ActiveRecord::Base.connection.select_value('select * from pg_extension')
end

def db_reset_sequences
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.reset_pk_sequence!(table)
  end
end

def find_dups
  group_by(&:itself).select { |_, value| value.count > 1 }.keys
end

def find_dups_tally
  group_by(&:itself).transform_values(&:count).reject { |_, value| value == 1 }
end

def rand_string length
  SecureRandom.alphanumeric(length)
end

# https://stackoverflow.com/a/9782550/7477016
def git_stats(sort: :total)
  impact = {}

  IO.popen("git log --pretty=format:\"%an\" --shortstat #{ARGV.join(' ')}") do |file|
    prev_line = ''
    while (line = file.gets)
      changes = /(\d+) insertion.* (\d+) deletion/.match(line)

      if changes
        impact[prev_line] ||= {}
        impact[prev_line][:additions] ||= 0
        impact[prev_line][:additions] += changes[1].to_i
        impact[prev_line][:deletions] ||= 0
        impact[prev_line][:deletions] += changes[2].to_i
        impact[prev_line][:total] ||= 0
        impact[prev_line][:total] += changes[1].to_i + changes[2].to_i
        impact[prev_line][:diff] ||= 0
        impact[prev_line][:diff] += changes[1].to_i - changes[2].to_i
      end

      prev_line = line # Names are on a line of their own, just before the stats
    end
  end

  impact.each do |author, hash|
    hash[:deletion_percent] = (hash[:deletions].fdiv(hash[:total]) * 100).round(2)
    hash[:addition_percent] = (hash[:additions].fdiv(hash[:total]) * 100).round(2)
  end

  impact.transform_keys! { |key| key.strip.downcase }

  $stdout.puts(
    format(
      "%<author>-40s %<additions>-11s %<deletions>-11s %<diff>-10s %<total>-10s %<deletion_percent>-10s %<addition_percent>-10s",
      {
        author: "author",
        additions: "inserts",
        deletions: "deletes",
        total: "total",
        diff: "diff",
        deletion_percent: "delete %",
        addition_percent: "insert %"
      }
    )
  )

  $stdout.puts "-" * 106

  if sort == :author
    impact.sort_by { |author, _hash| author }.each do |author, hash|
      $stdout.puts(
        format(
          "%<author>-40s +%<additions>-10s -%<deletions>-10s %<diff>-10s %<total>-10s %<deletion_percent>-10s %<addition_percent>-10s",
          {
            author: author,
            additions: hash[:additions],
            deletions: hash[:deletions],
            total: hash[:total],
            diff: hash[:diff],
            deletion_percent: hash[:deletion_percent],
            addition_percent: hash[:addition_percent]
          }
        )
      )
    end
  else
    impact.sort_by { |_author, hash| hash[sort] }.reverse_each do |author, hash|
      $stdout.puts(
        format(
          "%<author>-40s +%<additions>-10s -%<deletions>-10s %<diff>-10s %<total>-10s %<deletion_percent>-10s %<addition_percent>-10s",
          {
            author: author,
            additions: hash[:additions],
            deletions: hash[:deletions],
            total: hash[:total],
            diff: hash[:diff],
            deletion_percent: hash[:deletion_percent],
            addition_percent: hash[:addition_percent]
          }
        )
      )
    end
  end

  nil
end
