## install necessities
brew install bash
brew install git
brew install heroku
brew install imagemagick
brew install git-delta
brew install ripgrep
brew install gnupg

## redis
brew install redis
brew services start redis

## language version management
brew install coreutils curl git
brew install asdf

## install node
asdf plugin add nodejs
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs latest

## install ruby
asdf plugin add ruby
asdf install ruby latest

## install postgres
asdf plugin add postgres
asdf install postgres latest

## install yarn
asdf plugin-add yarn
asdf install yarn latest


## install apps - https://formulae.brew.sh/cask/
brew tap homebrew/cask-versions

brew install --cask appcleaner
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
brew install --cask firefox-nightly
brew install --cask google-chrome
brew install --cask google-chrome-canary
brew install --cask insomnia
brew install --cask postico
brew install --cask postman
brew install --cask safari-technology-preview
brew install --cask slack
brew install --cask sublime-merge
brew install --cask sublime-text
brew install --cask textmate
brew install --cask visual-studio-code
brew install --cask zoom

## install VS Code Extensions
code --install-extension 4ops.terraform
code --install-extension adamwalzer.scss-lint
code --install-extension alefragnani.Bookmarks
code --install-extension alefragnani.project-manager
code --install-extension alexdima.copy-relative-path
code --install-extension anikethsaha.htmllinter
code --install-extension castwide.solargraph
code --install-extension christian-kohler.npm-intellisense
code --install-extension ciebiada.ruby-copy-reference
code --install-extension codezombiech.gitignore
code --install-extension CoenraadS.bracket-pair-colorizer-2
code --install-extension dbaeumer.vscode-eslint
code --install-extension deerawan.vscode-dash
code --install-extension donjayamanne.git-extension-pack
code --install-extension donjayamanne.githistory
code --install-extension dunstontc.viml
code --install-extension eamodio.gitlens
code --install-extension GitHub.github-vscode-theme
code --install-extension jock.svg
code --install-extension lamartire.git-indicators
code --install-extension leizongmin.node-module-intellisense
code --install-extension mathiasfrohlich.Kotlin
code --install-extension misogi.ruby-rubocop
code --install-extension ms-vscode.typescript-javascript-grammar
code --install-extension oderwat.indent-rainbow
code --install-extension ritwickdey.LiveServer
code --install-extension SarahRidge.vscode-monokai-minimal
code --install-extension SarahRidge.vscode-rails-syntax
code --install-extension SarahRidge.vscode-ruby-syntax
code --install-extension shardulm94.trailing-spaces
code --install-extension shinworks.tmplcolorizer
code --install-extension sysoev.vscode-open-in-github
code --install-extension Togusa09.tmlanguage
code --install-extension traBpUkciP.vscode-npm-scripts
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension waderyan.gitblame
code --install-extension wmaurer.change-case
code --install-extension ziyasal.vscode-open-in-github


## heroku
heroku plugins:install heroku-cli-oauth
brew tap thoughtbot/formulae
brew install parity
