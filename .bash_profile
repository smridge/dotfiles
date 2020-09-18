[[ -s "$HOME/.local.bash_profile" ]] && source "$HOME/.local.bash_profile"

# brew
export PATH="/usr/local/sbin:$PATH"

reload() { . ~/.bash_profile; }
home() { cd ~; }
finder() { open -a Finder ./; }
dropbox() { cd ~/Dropbox; }
downloads() { cd ~/Downloads; }
desktop() { cd ~/Desktop; }
mkdiro() { mkdir -p "$@" && cd "$@" && pwd && finder; }


# editors
atom() { atom .; }
tmate() { mate .; }
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
alias db="git branch -D"
alias commit="git commit -am"
alias mkbranch="git checkout -b"
alias push="git push -u origin"
alias squash="git rebase --interactive HEAD~2"
alias standup="git standup"
alias gitreset="git reset --hard HEAD^"


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


# asdf for language version management
. $(brew --prefix asdf)/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
