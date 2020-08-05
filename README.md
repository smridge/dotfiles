## GitHub
- [Generate SSH Key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- [Get SSH Key on GitHub](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

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

## Install Browser Previewers
- [Google Canary](https://www.google.com/chrome/canary/thank-you.html?statcb=0&installdataindex=empty&defaultbrowser=0)
- [Safari Technolgy Preview](https://developer.apple.com/safari/technology-preview/)
- [Firefox Nightly](https://www.mozilla.org/en-US/firefox/channel/desktop/)

## Install Chrome Extensions
- [RailsPanel](https://chrome.google.com/webstore/detail/railspanel/gjpfobpafnhjhbajcjgccbbdofdckggg?hl=en-US)

## Other
- Setup `.dotfiles`

## Tool References
- [asdf](https://asdf-vm.com/#/core-commands)
- [regex 101](https://regex101.com)
- [crontab](https://crontab.guru)


### Troubleshooting
- `Cant find gem bundler (>= 0.a) with executable bundle`
  - https://bundler.io/blog/2019/05/14/solutions-for-cant-find-gem-bundler-with-executable-bundle.html

### TODO
- Setup automated `.dotfiles` creation.
