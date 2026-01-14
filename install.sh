## install necessities
brew install bash
brew install git
brew install heroku
brew install imagemagick
brew install git-delta
brew install ripgrep
brew install gnupg

# asdf nodejs
brew install gpg gawk

# asdf ruby
brew install zlib
brew install libyaml

# asdf postgres
brew install gcc
brew install curl
brew install ossp-uuid
brew install pkg-config

## language version management
brew install coreutils
brew install asdf

## install node
asdf plugin add nodejs
asdf install nodejs latest

## install ruby
asdf plugin add ruby
asdf install ruby latest

## install postgres
asdf plugin add postgres
asdf install postgres latest

## install yarn
asdf plugin add yarn
asdf install yarn latest

## install redis
asdf plugin add redis
asdf install redis latest

## install rust
asdf plugin add rust
asdf install rust latest

## install python
asdf plugin add python
asdf install python latest


## install apps - https://formulae.brew.sh/cask/
brew tap homebrew/cask-versions

brew install --cask appcleaner
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
brew install --cask firefox@nightly
brew install --cask google-chrome
brew install --cask google-chrome@canary
brew install --cask insomnia
brew install --cask postico
brew install --cask postman
brew install --cask safari-technology-preview
brew install --cask slack
brew install --cask sublime-merge
brew install --cask sublime-text
brew install --cask visual-studio-code
brew install --cask zoom

## install VS Code Extensions
code --install-extension 4ops.terraform
code --install-extension adamwalzer.scss-lint
code --install-extension alefragnani.bookmarks
code --install-extension alefragnani.project-manager
code --install-extension alexdima.copy-relative-path
code --install-extension anikethsaha.htmllinter
code --install-extension bierner.github-markdown-preview
code --install-extension bierner.markdown-checkbox
code --install-extension bierner.markdown-emoji
code --install-extension bierner.markdown-footnotes
code --install-extension bierner.markdown-mermaid
code --install-extension bierner.markdown-preview-github-styles
code --install-extension bierner.markdown-yaml-preamble
code --install-extension borama.ruby-slim
code --install-extension castwide.solargraph
code --install-extension christian-kohler.npm-intellisense
code --install-extension ciebiada.ruby-copy-reference
code --install-extension codezombiech.gitignore
code --install-extension cweijan.dbclient-jdbc
code --install-extension cweijan.vscode-postgresql-client2
code --install-extension dbaeumer.vscode-eslint
code --install-extension deerawan.vscode-dash
code --install-extension donjayamanne.githistory
code --install-extension dunstontc.viml
code --install-extension eamodio.gitlens
code --install-extension github.copilot
code --install-extension github.copilot-chat
code --install-extension github.github-vscode-theme
code --install-extension jock.svg
code --install-extension lamartire.git-indicators
code --install-extension leizongmin.node-module-intellisense
code --install-extension lorankloeze.ruby-rubocop-revived
code --install-extension mathiasfrohlich.kotlin
code --install-extension misogi.ruby-rubocop
code --install-extension ms-ossdata.vscode-pgsql
code --install-extension oderwat.indent-rainbow
code --install-extension pedro-w.tmlanguage
code --install-extension redcmd.tmlanguage-syntax-highlighter
code --install-extension ritwickdey.liveserver
code --install-extension sarahridge.vscode-monokai-minimal
code --install-extension sarahridge.vscode-rails-syntax
code --install-extension sarahridge.vscode-ruby-syntax
code --install-extension shardulm94.trailing-spaces
code --install-extension shinworks.tmplcolorizer
code --install-extension shopify.ruby-lsp
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension sysoev.vscode-open-in-github
code --install-extension trabpukcip.vscode-npm-scripts
code --install-extension waderyan.gitblame
code --install-extension wmaurer.change-case


## heroku
heroku plugins:install heroku-cli-oauth
brew tap thoughtbot/formulae
brew install parity
