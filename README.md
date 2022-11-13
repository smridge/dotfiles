## GitHub
- [Generate SSH Key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Add SSH Key to GitHub](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)
- [Generate GPG Key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)
- [Add GPG Key to GitHub](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)

## Basics
### Install Brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### Set Bash as Default
- https://itnext.io/upgrading-bash-on-macos-7138bd1066ba

### Download/Install Necessities
```
git clone git@github.com:smridge/dotfiles.git
cd dotfiles
bash ./install.sh
```

### Install [vim-plug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Make and Copy `.vimrc` for Plugins

```
$ vim
:PlugInstall
```

## Install Chrome Extensions
- [RailsPanel](https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg?hl=en-US)

## Other
- Setup `.dotfiles`

## Tool References
- [asdf](https://asdf-vm.com/#/core-commands)
- [crontab](https://crontab.guru)
- [JSON Schema Store](https://www.schemastore.org/json/)
- [regex 101](https://regex101.com)

## VS Code Keybindings
### Custom
- Redo: <kbd>command</kbd> <kbd>Y</kbd>
- Delete Current Line or Selected Lines: <kbd>command</kbd> <kbd>D</kbd> <kbd>D</kbd>
- Delete everything Left of Cursor for current line: <kbd>command</kbd> <kbd>D</kbd> <kbd>L</kbd>
- Delete everything Right of Cursor for current line: <kbd>command</kbd> <kbd>D</kbd> <kbd>R</kbd>
- Copy Relative Path: <kbd>command</kbd> <kbd>K</kbd> <kbd>P</kbd>
- Highlight Current Word and grow: <kbd>command</kbd> <kbd>H</kbd>
- Add Cursor to Next Match: <kbd>shift</kbd> <kbd>command</kbd> <kbd>down</kbd>
- Cursor Word Start Right (Next): <kbd>shift</kbd> <kbd>option</kbd> <kbd>E</kbd>
- Cursor Word Start Left (Back): <kbd>option</kbd> <kbd>A</kbd>
- Copy and Paste current line/selection below: <kbd>option</kbd> <kbd>Y</kbd> <kbd>P</kbd>
- Open settings.json: <kbd>option</kbd> <kbd>J</kbd>
- Inspect Language Definition/TextMate Scope: <kbd>option</kbd> <kbd>T</kbd>

### Default
- Go to File: <kbd>command</kbd> <kbd>P</kbd>
- Copy Full Path: <kbd>command</kbd> <kbd>option</kbd> <kbd>P</kbd>
- Cursor Start of Line: <kbd>control</kbd> <kbd>A</kbd>
- Cursor End of Line: <kbd>control</kbd> <kbd>E</kbd>
- Transform Upcase: <kbd>command</kbd> <kbd>K</kbd> <kbd>U</kbd>
- Transform downcase: <kbd>command</kbd> <kbd>K</kbd> <kbd>L</kbd>
- Select Line: <kbd>command</kbd> <kbd>L</kbd>


### Troubleshooting
- `Cant find gem bundler (>= 0.a) with executable bundle`
  - run: `gem update --system`
  - https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html

- `asdf: No preset version installed for command xyz`
  - run: `asdf reshim`
  - also try: `rm -rf ~/.asdf/shims; asdf reshim`

- `bundle update: An error occurred while installing puma`
  - run bash alias: `redo_xcodetools`

- `ActiveRecord::ProtectedEnvironmentError: You are attempting to run a destructive action against your 'production' database.`
  - run: `bundle exec rake db:environment:set RACK_ENV=development`

- `PG::ConnectionBad: FATAL:  role "postgres" does not exist`
  - run: `createuser -s -r postgres`

- `bundle exec rails c` not loading (no error, instead seems to not recognize command)
  - run: `bin/spring stop`

- `psql:..structure.sql: ERROR:  could not open extension control file "../.asdf/installs/postgres/11.8/share/extension/uuid-ossp.control": No such file or directory`
  - see: https://stackoverflow.com/questions/20810921/cant-use-uuid-and-create-an-extension-to-use-it/51918361#51918361
  - should be resolved going forward with option set in `.asdf-postgres-configure-options`
