
# Universal stuff
export PATH="$HOME/go/bin:$PATH"
export EDITOR="nvim"

export GO111MODULE=on
export GOPRIVATE="github.com/xiatechs"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export TERM=screen-256color
export XDG_CONFIG_HOME=$HOME/.config/

# Mac stuff
if [[ $(uname) = "Darwin" ]];
then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=~/Applications:$PATH
  export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
  export GEM_HOME="$HOME/.gem"
fi 


# Linux stuff
if [[ $(uname) = "Linux" ]];
then
  export GOROOT=/usr/lib/go

  # if x server is running
  #if [[ $DISPLAY ]];
  #then 
    export TERM="alacritty"

    # export WALL_PATH=~/Pictures/wallpapers
    export WALL_PATH=~/Pictures/vapourwaveWalls

    # Themes
    GTK_THEME=Adapta-Nokto
    export QT_QPA_PLATFORMTHEME="qt5ct"
    export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

    # For xdg-open
    alias open="xdg-open"

    #export PATH="$PATH:$HOME/apps/clion-2020.2.4/bin"
    #export PATH="$PATH:$HOME/apps/android-studio/bin/"
    export PATH="$PATH:$HOME/apps/monero-gui"
  #fi

  export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools/bin"
  export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
  export PATH="$PATH:$ANDROID_SDK_ROOT/emulator"
  export CAPACITOR_ANDROID_STUDIO_PATH="/bin/android-studio"


  # General
  #export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/bin/java"
  export JAVA_HOME=/usr/lib/jvm/default-runtime
  export PATH="$JAVA_HOME/bin:$PATH"


  export PATH="$PATH:$HOME/.local/bin/"
  export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
fi

# Aliases
alias cls="clear"
alias ll="ls -al"
alias lf="lfub"
alias tx="tmux -u"

# GO
gocov() {
  go test -coverprofile=.cover.out $@ &&
  go tool cover -html=.cover.out -o coverage.html &&
  xdg-open coverage.html &&
  sleep 1 &&
  rm .cover.out coverage.html;
}


# Git bare repo for the dotconfigs
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgau='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add -u'
alias cfga='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add'
alias cfgc='git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m'
alias cfgp='git --git-dir=$HOME/.cfg/ --work-tree=$HOME push'
alias cfgs='git --git-dir=$HOME/.cfg/ --work-tree=$HOME status'

# Git aliases
alias g="git"
alias gaa="git add --all"
alias ga="git add "
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gss="git submodule status"
alias gsa="git submodule add"
alias gd="git diff"
alias gf="git fetch"
# Open all modified git files in vim
alias gvi="git ls-files --modified | xargs nvim"

# Stage all git files that can be grepped by a query
gas() {
  [ -z $1 ] && echo "Need parameter" && return 1
  echo "Query: "$1
  FILES=$(git ls-files --modified --others | grep "$1" ) 
  echo $FILES
  echo $FILES | xargs git add 
}

# For creating a new branch and automatically switching to it
gnb() {
  [ -z $1 ] && echo "Need name of branch" && return 1
  echo "Creating new git branch and switching to it " $1
  git branch $1
  git checkout $1
}

# For pushing upstream to a fresh branch 
gpnu() {
  echo "Pushing to new branch upstream"
  git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

# Tree alias to ignore node_modules
#  Tree Ignore Node
alias tin="tree -I 'node_modules'"

# swapping vi for nvim
alias vi="nvim"

