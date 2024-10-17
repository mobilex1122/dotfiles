# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1


clear
fastfetch
echo ""

#PS1='  %F{117}  %F{111}%n%F{255}@%F{111}%m %F{100}%~ %F{247} %F{255}'

PS1=' %(#.%F{160}.%F{117})  %F{111}%n%F{255}@%F{111}%m %F{100}%~ %F{247} %F{255}'

## Sets SUDO Prompt to nicer one
export SUDO_PROMPT=" 󰢏  Password for %u: "
#RPS1='%(?.%F{040} .%F{160} )%F '


alias simplefetch="fastfetch --config ~/.config/fastfetch/simple.jsonc"
alias rsh='source ~/.zshrc'
alias dotfilesgit='lazygit -p ~/.dotfiles'
alias fyou='echo "Fuck you too!!" && sleep 1 && exit'
alias cls='clear'
alias ani-cat="ANI_CLI_PLAYER=catt ani-cli"


# The following lines were added by compinstall
zstyle :compinstall filename '/home/mobilex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
  echo "Shell is running in SSH mode"
  clear
  PS1="[SSH] %c > "
  
  if [ $(tput cols) -gt 70 ]; then
    echo ""
    simplefetch
    echo ""
    PS1="[SSH] %n@%m %c > "
  fi
  export SUDO_PROMPT="[SUDO SSH] Password for %u: "
fi

if [[ $TTY == /dev/tty[0-9] ]]; then
  clear
  echo ""
  simplefetch
  echo ""
  PS1="[VC] %n@%m %c > "
  export SUDO_PROMPT="[SUDO VC] Password for %u: "
fi

