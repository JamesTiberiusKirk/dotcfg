export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR="vim"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# export TERM="alacritty"
# export WALL_PATH=~/Pictures/wallpapers
export WALL_PATH=~/Pictures/vapourwaveWalls
export SCREEN1W="$WALL_PATH/wp4118649-vapor-wave-desktop-4k-wallpapers.jpg" # starting wall
# export LOCKSCREEN_WALL="$WALL_PATH/wp7758145-vapor-wave-desktop-4k-wallpapers.jpg" # starting wall

# Paths and bins
export JAVA_HOME="/usr/lib/jvm/java-15-openjdk/"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/apps/clion-2020.2.4/bin"
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$HOME/apps/appimages/"
export PATH="$PATH:$HOME/apps/android-studio/bin/"

# Aliases
alias cls="clear"
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
alias gss="git submodule status"
alias gsa="git submodule add"

# For quick CDs in the projects folder
alias pj="function _(){echo '/home/darthvader/Projects/$1 ';}; _"

# Tree alias to ignore node_modules
#  Tree Ignore Node
alias tin="tree -I 'node_modules'"

# For xdg-open
alias open="xdg-open"
