# dotfiles

## Clone Repo to ~/.dotfiles
```
git clone https://github.com/mobilex1122/dotfiles.git ~/.dotfiles
```

## Install pacman packages
```
sudo pacman -S - < ~/.dotfiles/software/pacman-packages.txt
```

## Create symlinks (will be automated)
```
ln -s ~/.dotfiles/kitty/ ~/.config/
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```
