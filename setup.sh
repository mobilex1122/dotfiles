# /bin/bash

BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m'


## check if script runs as sudo (root) 
echo -e "${BLUE}########## DOTFILE Install ##########${NOCOLOR}\n"
if [[ $EUID -eq 0 ]]; then
    echo "Error: This script can't run as root (paths break)"
    exit 1
fi

echo -e "You will be prompted for sudo password every time is needed.\n${YELLOW}"
echo -e "Press Enter to continue or Ctrl+C to cancel. ${NOCOLOR}"
read

echo -e "\n${BLUE}INFO: Adding execute permision to setup scripts.${NOCOLOR}"
find setup-*.sh
chmod +x setup-*.sh

echo -e "\n${BLUE}INFO: Creating symlinks${NOCOLOR}"

./setup-symlink.sh

## Install packages (arch distros only)
if cat /etc/os-release | grep -q ID_LIKE=arch; then
    echo -e "\n${BLUE}INFO: Installing Pacman packages (sudo needed)${NOCOLOR}"
    ./setup-pacman.sh
	
	echo -e "\n${BLUE}INFO:Installing Yay and aur_packages${YELLOW}"
   	echo -e "Do you want to proceed? (yes/no): ${NOCOLOR}" 
   	read choice
   	if [[ "$choice" =~ ^[Yy][Ee][Ss]$ ]]; then
   	    echo -e "${BLUE}INFO: Installing yay${NOCOLOR}"
   	    ./setup-yay.sh
   	    echo -e "${BLUE}IFNO: Installing AUR repos using yay${NOCOLOR}"
   	    ./setup-yay-aur.sh
   	else
   	  	echo -e "\n${BLUE}INFO: Skipped yay instalation.${NOCOLOR}"
   	fi

else
    echo -e "\n${RED}WARN: This is not Arch based distro! Skiping package instalation (refer to software/*-packages.txt)"
fi

echo -e "\n${BLUE}INFO: Installing and seting up shell${NOCOLOR}"

./setup-shell.sh


echo -e "\n${BLUE}INFO: Removing execute permision from setup scripts.${NOCOLOR}"
find setup-*.sh
chmod +x setup-*.sh
echo -e "\n${YELLOW}All done!${NOCOLOR}"
