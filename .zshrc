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


source ~/.zsh-plugins/autocomplate/zsh-autocomplete.plugin.zsh
