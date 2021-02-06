export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR="vim"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERM="alacritty"

export PATH="$PATH:$HOME/apps/clion-2020.2.4/bin"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

alias ll="ls -al"

# Git bare repo for the dotconfigs
alias cfg='git --git-dir=/home/darthvader/.cfg/ --work-tree=/home/darthvader'
alias cfgau='git --git-dir=/home/darthvader/.cfg/ --work-tree=/home/darthvader add -u'
alias cfga='git --git-dir=/home/darthvader/.cfg/ --work-tree=/home/darthvader add'
alias cfgc='git --git-dir=/home/darthvader/.cfg/ --work-tree=/home/darthvader commit -m'
alias cfgp='git --git-dir=/home/darthvader/.cfg/ --work-tree=/home/darthvader push'

# Git aliases
alias gaa="git add --all"
alias ga="git add "
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"


# For quick CDs in the projects folder
alias pj="function _(){echo '/home/darthvader/Projects/$1 ';}; _"


# For xdg-open
alias open="xdg-open"
