source "$XDG_CONFIG_HOME/zsh/aliases"

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

fpath=($ZDOTDIR/external $fpath)

# Setup a nice pretty prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup


# Directory push and pop #

# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor for vi mode
autoload -Uz cursor_mode && cursor_mode

# Use vim navigation for auto-completion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Editing commands in neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Syntax highlight
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Jumping to a parent directory
source ~/dotfiles/zsh/external/bd.zsh

# Remove ctrl + l to clear screen (instead used for navigation)
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# Automation stuff
source $DOTFILES/zsh/scripts.sh

# Fuzzy Finder
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# Start i3 automatically
if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
