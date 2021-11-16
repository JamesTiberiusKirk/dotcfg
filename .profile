
# Universal stuff
export PATH="$HOME/go/bin:$PATH"
export GOPATH="$HOME/go"

# Mac stuff
if [[ $(uname) = "Darwin" ]];
then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=~/Applications:$PATH
fi 


# Linux stuff
if [[ $(uname) = "Linux" ]];
then
  export QT_QPA_PLATFORMTHEME="qt5ct"
  export EDITOR="nvim"
  export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
  export TERM="alacritty"
  # export WALL_PATH=~/Pictures/wallpapers
  export WALL_PATH=~/Pictures/vapourwaveWalls
  export SCREEN1W="$WALL_PATH/wp4118649-vapor-wave-desktop-4k-wallpapers.jpg" # starting wall
  # export LOCKSCREEN_WALL="$WALL_PATH/wp7758145-vapor-wave-desktop-4k-wallpapers.jpg" # starting wall
  # export PATH="$PATH:$HOME/apps/appimages/"

  # General
  # export JAVA_HOME="/usr/lib/jvm/java-15-openjdk/"
  # export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"

  export PATH="$JAVA_HOME/bin:$PATH"
  export PATH="$PATH:$HOME/apps/clion-2020.2.4/bin"
  export PATH="$PATH:$HOME/apps/monero-gui-v0.17.2.2"
  export PATH="$PATH:$HOME/.local/bin/"
  export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
  export PATH="$PATH:$HOME/apps/android-studio/bin/"

  # Themes
  GTK_THEME=Adapta-Nokto

  # For xdg-open
  alias open="xdg-open"
fi

# Aliases
alias cls="clear"
alias ll="ls -al"

# Git bare repo for the dotconfigs
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgau='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add -u'
alias cfga='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add'
alias cfgc='git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m'
alias cfgp='git --git-dir=$HOME/.cfg/ --work-tree=$HOME push'
alias cfgs='git --git-dir=$HOME/.cfg/ --work-tree=$HOME status'

# Git aliases
alias gaa="git add --all"
alias ga="git add "
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gss="git submodule status"
alias gsa="git submodule add"
alias gd="git diff"

gas() {
  [ -z $1 ] && echo "Need parameter" && return 1
  echo "Query: "$1
  FILES=$(git ls-files --modified --others | grep "$1" ) 
  echo $FILES
  echo $FILES | xargs git add 
}

# Tree alias to ignore node_modules
#  Tree Ignore Node
alias tin="tree -I 'node_modules'"

# swapping vi for nvim
alias vi="nvim"

