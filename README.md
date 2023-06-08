# dotfiles

## Clone Repo to ~/.dotfiles
```
git clone https://github.com/mobilex1122/dotfiles.git
```

## Install pacman packages
```
sudo pacman -S - < ./software/pacman-packages.txt
```

## Create symlinks (will be automated)
```
ln -s ~/.dotfiles/kitty/ ~/.conf/
ln -s ~/.dotfiles/.gitconf ~/.gitconf
```
