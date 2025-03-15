[[ -s "$HOME/.local.bash_profile" ]] && source "$HOME/.local.bash_profile"

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf version manager
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# asdf postgres
export PGHOST=localhost
export PKG_CONFIG_PATH="/opt/homebrew/bin/pkg-config:$(brew --prefix icu4c)/lib/pkgconfig:$(brew --prefix curl)/lib/pkgconfig:$(brew --prefix zlib)/lib/pkgconfig"

## install older ruby versions
# https://github.com/rbenv/ruby-build/discussions/2185#discussioncomment-11907180
# For ruby 2.6, 2.7, 3.0:
# RUBY_APPLY_PATCHES="https://github.com/ruby/ruby/commit/1dfe75b0beb7171b8154ff0856d5149be0207724.patch" asdf install ruby 3.0.7
#
# For ruby 2.5:
# RUBY_CFLAGS=-DUSE_FFI_CLOSURE_ALLOC asdf install ruby 2.5.9

# asdf ruby install
# https://github.com/asdf-vm/asdf-ruby/issues/328#issuecomment-1650046559
export RUBY_CONFIGURE_OPTS="
  --with-zlib-dir=$(brew --prefix zlib)
  --with-readline-dir=$(brew --prefix readline)
  --with-libyaml-dir=$(brew --prefix libyaml)
"

# GPG
# error: gpg: signing failed: Inappropriate ioctl for device
export GPG_TTY=$(tty)

reload() { . ~/.bash_profile; }
home() { cd ~; }
finder() { open -a Finder ./; }
dropbox() { cd ~/Dropbox; }
downloads() { cd ~/Downloads; }
desktop() { cd ~/Desktop; }
mkdiro() { mkdir -p "$@" && cd "$@" && pwd && finder; }
mime() { file -b --mime "$@"; }


# editors
atom() { atom .; }
sub() { sublime .; }
vs() { code .; }
vslist() { code --list-extensions; }


# git
## show branch & path in terminal
parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'; }
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

## show branch status and log details
status() { echo -e "\n\033[1m$(git status)\033[0m" && echo -e "\n\033[1;2;4mLast 20 Commits\033[0m" && deets; }
deets() { git log --color --pretty=format:'%Cred%h%Creset - %C(green)%ar%Creset, %C(bold blue)%an%Creset : %C(dim)%s%Creset' | head -n 20; }

## general
gfind() { git log --all --grep="$@"; }
lb() { git branch; }
main() { git checkout main; }
master() { git checkout master; }
pull() { git pull origin "$@"; }
branch() { git branch 2>/dev/null | grep '^*' | colrm 1 2; }
pushb() { git push -u origin $branch; }
alias add="git add ."
alias amend="git commit --amend -m"
alias cb="git checkout"
alias commit="git commit -am"
alias commitempty="git commit --allow-empty -m 'Trigger Build'"
alias db="git branch -D"
alias gitreset="git reset --hard HEAD^"
alias mkbranch="git checkout -b"
alias push="git push -u origin"
alias scommit="git commit -S -am"
alias squash="git rebase --interactive HEAD~2"
alias standup="git standup"

alias listening="sudo lsof -iTCP -sTCP:LISTEN -n -P"


# rails
## server
alias rpuma="bundle exec rails s puma"
alias rpuma3001="bundle exec rails s puma -p 3001"
alias rpuma80="rails server Puma -b 0.0.0.0 -p 80 -e development"
alias lvh="bundle exec rails s -b lvh.me"
alias pumashow="ps aux | grep puma"
alias killpuma="pkill -9 -f puma"
alias 3000="lsof -i tcp:3000"

## services
alias kiq="bundle exec sidekiq --environment development -C config/sidekiq.yml"
alias grok="ngrok http 3000"

## console
alias rc="bundle exec rails console"
alias sandbox="bundle exec rails console --sandbox"

## general
alias migrate="bundle exec rails db:migrate"
alias be="bundle exec"
ctmp() { rake tmp:clear && rake tmp:cache:clear && rake tmp:sessions:clear && rake tmp:sockets:clear; }

## simplecov
alias cov="open coverage/index.html"


# tool issues
alias redo_xcodetools="sudo rm -rf /Library/Developer/CommandLineTools && sudo xcode-select --install"

# install postgis `getpostgis 3.0.0`
# http://www.thinkingco.de/posts/different-versions-of-postgis-with-asdf-postgres
function getpostgis () {
    wget -q -P tmp/ https://github.com/postgis/postgis/archive/"$@".tar.gz
    tar xvzf tmp/"$@".tar.gz -C tmp/
    cd tmp/postgis-"$@"
    if [[ ! -a ./configure ]]; then
      ./autogen.sh
    fi
    eval ./configure `pg_config --configure`
    make
    make install
    cd ../..
    rm -rf tmp/
}
