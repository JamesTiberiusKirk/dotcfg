
# Universal stuff
export PATH="$HOME/go/bin:$PATH"
export EDITOR="nvim"

export GO111MODULE=on
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
# export TERM=alacritty
export XDG_CONFIG_HOME=$HOME/.config/
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export PATH=$HOME/.emacs.d/bin:$PATH

export PATH=$PATH:~/.cargo/bin/

# Grpc client cli autocompletion
# PROG=grpc-client-cli
# _CLI_ZSH_AUTOCOMPLETE_HACK=1
# source  autocomplete/zsh_autocomplete

# source ~/.env

export GITLAB_HOST=git.systems.io
export GOPRIVATE=git.systems.io/*

# Mac stuff
if [[ $(uname) = "Darwin" ]];
then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=~/Applications:$PATH
  export PATH="/opt/homebrew/opt/node@16/bin:$PATH" 

  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
  chruby ruby-3.1.2

  source "$HOME/.cargo/env"

  # Redbrain stuff
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  source <(stern --completion=zsh)

  autoload -U compinit && compinit

fi 


# Linux stuff
if [[ $(uname) = "Linux" ]];
then
    export QT_QPA_PLATFORMTHEME=qt5ct
    export GOROOT=/usr/lib/go
    export PATH=~/.bin:$PATH

    export DISPLAY=:0

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
  rm .cover.out coverage.html
}


# Git bare repo for the dotconfigs
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgau='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add -u'
alias cfga='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add'
alias cfgc='git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m'
alias cfgp='git --git-dir=$HOME/.cfg/ --work-tree=$HOME push'
alias cfgs='git --git-dir=$HOME/.cfg/ --work-tree=$HOME status'

# Git aliases alias g="git" alias gaa="git add --all" alias ga="git add " alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"
alias gss="git submodule status"
alias gsa="git submodule add"
alias gd="git diff"
alias gf="git fetch"
alias gc="git commit -m"
alias gcm="git checkout master"
# Open all modified git files in vim
alias gvi="git ls-files --modified | xargs nvim"

# Merging master to current
gmm() {
  ORIGINAL_BRANCH=$(git branch --show-current)
  git checkout master
  git pull
  git checkout $ORIGINAL_BRANCH
  git merge master
}

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
