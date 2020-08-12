# frozen_string_literal: true

require "erb"

include ERB::Util
extend Rails::ConsoleMethods if defined?(Rails) && Rails.env

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

def methods klass
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

def find_dups
  group_by(&:itself).select { |_, value| value.count > 1 }.keys
end

def find_dups_tally
  group_by(&:itself).transform_values(&:count).reject { |_, value| value == 1 }
end

def rand_string string_length
  characters = [*"A".."Z", *"0".."9"]
  characters.sample(string_length).join
end
