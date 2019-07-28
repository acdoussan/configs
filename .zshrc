# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# UTF-8 language settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

ZSH_THEME="powerlevel9k/powerlevel9k"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

POWERLEVEL9K_PROMPT_ON_NEWLINE="true"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

plugins=(
  git
)

# solarized terminal settings
source ~/sol.dark

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -nw'
else
  export EDITOR='emacs -nw'
fi

alias e='emacs -nw'
alias tmux='tmux -2 -u'

# apply solarize ls colors
eval `dircolors ~/.dircolors`

# keybindings
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward

# fix for dircolors not working on autocomplete
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
