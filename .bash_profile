reload() { . ~/.bash_profile; }
home() { cd ~; }
finder() { open -a Finder ./; }
dropbox() { cd ~/Dropbox; }
downloads() { cd ~/Downloads; }
desktop() { cd ~/Desktop; }
mkdiro() { mkdir -p "$@" && cd "$@" && pwd && finder; }

# editors
atom() { atom .; }
mate() { mate .; }
sub() { sublime .; }
vs() { code .; }
vslist() { code --list-extensions; }

# GIT
# Shows Branch and Path in Terminal
parse_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'; }
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Show Branch Status and Git Log Details
status() { echo -e "\n\033[1m$(git status)\033[0m" && echo -e "\n\033[1;2;4mLast 20 Commits\033[0m" && deets; }
deets() { git log --color --pretty=format:'%Cred%h%Creset - %C(green)%ar%Creset, %C(bold blue)%an%Creset : %C(dim)%s%Creset' | head -n 20; }

pull() { git pull origin master; }
master() { git checkout master; }
lb() { git branch; }
alias cb="git checkout"
alias mkbranch="git checkout -b"
alias add="git add ."
alias commit="git commit -am"
alias squash="git rebase --interactive HEAD~2"
alias push="git push -u origin"
alias db="git branch -D"
alias amend="git commit --amend -m"
gfind() { git log --all --grep="$@"; }

## RAILS
alias puma="bundle exec rails s puma"
alias puma3001="bundle exec rails s puma -p 3001"
alias puma80="rails server Puma -b 0.0.0.0 -p 80 -e development"
alias pumashow="ps aux | grep puma"
alias killpuma="pkill -9 -f puma"
alias 3000="lsof -i tcp:3000"

alias kiq="bundle exec sidekiq --environment development -C config/sidekiq.yml"
alias grok="ngrok http 3000"

alias migrate="bundle exec rails db:migrate"
alias rc="bundle exec rails console"
alias be="bundle exec"
ctmp() { rake tmp:clear && rake tmp:cache:clear && rake tmp:sessions:clear && rake tmp:sockets:clear; }

alias rm_xcodetools="sudo rm -rf /Library/Developer/CommandLineTools && sudo xcode-select --install"

# asdf for language version management
. $(brew --prefix asdf)/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
