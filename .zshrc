# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

autoload -Uz promptinit
promptinit



# Define the theme
prompt_mytheme_setup() {
  PS1="%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f > "
}

# Add the theme to promptsys
prompt_themes+=( mytheme )

# Load the theme
prompt mytheme


##source ~/.zsh-plugins/autocomplate/zsh-autocomplete.plugin.zsh

## Accepts command without closing autocomplate
#bindkey -M menuselect '\r' .accept-line

#bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
#bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# export LD_LIBRARY_PATH=/usr/lib/qt/plugins:/usr/lib


echo ""
fastfetch

alias debian-start='docker start 14ef01884ea2'
alias debian-attach='docker attach 14ef01884ea2'
alias debian-stop='docker stop 14ef01884ea2'

export PATH="$PATH:/home/mobilex/apps/flutter/bin:/home/linuxbrew/.linuxbrew/bin/"
export PATH="$PATH:$HOME/.config/itch/apps/butler"
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin/"
export ANDROID_HOME=~/Android/Sdk

# pnpm
export PNPM_HOME="/home/mobilex/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# Load Angular CLI autocompletion.
source <(ng completion script)
