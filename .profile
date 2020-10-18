export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR="vim"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERM="alacritty"

export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

alias config='/usr/bin/git --git-dir=/home/darthvader/.cfg/ --work-tree=/home/darthvader'
alias ll="ls -al"
