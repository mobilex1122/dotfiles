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
#RPS1='%(?.%F{040} .%F{160} )%F '

alias rsh='source ~/.zshrc'
alias dotfilesgit='lazygit -p ~/.dotfiles'
alias fyou='echo "Fuck you too!!" && sleep 1 && exit'
alias cls='clear'

# The following lines were added by compinstall
zstyle :compinstall filename '/home/mobilex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


