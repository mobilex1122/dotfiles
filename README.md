# dotfiles

## Clone Repo to ~/.dotfiles
```
git clone https://github.com/mobilex1122/dotfiles.git ~/.dotfiles
git submodule update --init --recursive
```

## Automatic installation
**NOTE:** This is Arch based distros only

1. 	Make setup.sh executable
	```
	chmod +x setup.sh
	```
2. 	Run setup.sh
	```
	./setup.sh
	```

## Manual installation

1. Install pacman packages
```
sudo pacman -S - < ~/.dotfiles/software/pacman-packages.txt
```

2. Create symlinks (will be automated)
```
ln -s ~/.dotfiles/kitty/ ~/.config/
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
```

