# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lt'

## Color Prompt
COLOR_RED="\[\033[1;31m\]"
COLOR_WHITE="\[\033[0;00m\]"
COLOR_GREEN="\[\033[0;32m\]"

export PS1="${COLOR_GREEN}\u${COLOR_WHITE}@${COLOR_GREEN}\h:${COLOR_WHITE}\w$ "
