# Universal stuff
export GPG_TTY=$(tty)
export PATH="$HOME/go/bin:$PATH"
# SEE bottom of the file
export EDITOR="nvim"

export GO111MODULE=on
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export TERM=alacritty
export XDG_CONFIG_HOME=$HOME/.config/
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

export PATH=$PATH:$HOME/.emacs.d/bin

export PATH=$PATH:~/.cargo/bin/
export GOPRIVATE=github.com/aviva-verde

# source ~/.env

if [[ $(uname) = "Darwin" ]]; then
	export PATH=/opt/homebrew/bin:$PATH
	export PATH=~/Applications:$PATH
	export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
	export PATH="$HOME/.docker/bin:$PATH"
	export PATH="/opt/homebrew/opt/ffmpeg@4/bin/:$PATH"

	source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
	source /opt/homebrew/opt/chruby/share/chruby/auto.sh


	kill_port (){
		kill -9 $(lsof -ti:$1)
	}
fi
if [[ $(uname) = "Linux" ]]; then
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
alias txa="tmux -u a"

# Git bare repo for the dotconfigs
alias cfg='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias cfgau='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add -u'
alias cfga='git --git-dir=$HOME/.cfg/ --work-tree=$HOME add'
alias cfgc='git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m'
alias cfgp='git --git-dir=$HOME/.cfg/ --work-tree=$HOME push'
alias cfgs='git --git-dir=$HOME/.cfg/ --work-tree=$HOME status'

# Git aliases alias g="git" alias gaa="git add --all" alias ga="git add " alias gc="git commit -m"
alias gp="git push --no-verify"
alias gpl="git pull"
alias gs="git status"
alias gss="git submodule status"
alias gsa="git submodule add"
alias gd="git diff"
alias gf="git fetch"
alias gc="git commit -m"
alias gcs="git commit --no-verify -S -s -m"
# Open all modified git fil -ses in vim
alias gvi="git ls-files --modified | xargs nvim"
alias lg="lazygit"

# Squash all in the current branch
gqb() {
	commit_msg=$1
	master_branch=$(git symbolic-ref refs/remotes/origin/HEAD | grep -o '[^/]*$')
	current_branch=$(git branch --show-current)
	commit=$(git merge-base $master_branch $current_branch)
	git reset $commit
	git add --all

	[[ -z $commit_msg ]] && echo "\n\n\n\nAll done, create a commit and push with --force now" && kill -INT $$
	git commit -m $commit_msg
	git push --force
}

# Merging master to current
gmm() {
	ORIGINAL_BRANCH=$(git branch --show-current)
	MASTER_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD | grep -o '[^/]*$')
	git checkout $MASTER_BRANCH
	git pull
	git checkout $ORIGINAL_BRANCH
	git merge $MASTER_BRANCH
}

# Stage all git files that can be grepped by a query
gas() {
	[ -z $1 ] && echo "Need parameter" && return 1
	echo "Query: "$1
	FILES=$(git ls-files --modified --others | grep "$1")
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
	git push --no-verify  --set-upstream origin $(git rev-parse --abbrev-ref HEAD)
}

# Tree alias to ignore node_modules
#  Tree Ignore Node
alias tin="tree -I 'node_modules'"

alias ghpr_authors="gh pr view $1 --json commits --jq '.commits[].authors[].login ' | sort -u"
alias gh_prod_pr="gh pr create -B production --head staging -t 'staging -> production'"

function gh_staging_pr {
	HEAD=$(git symbolic-ref refs/remotes/origin/HEAD | grep -o '[^/]*$')
	[ -z $HEAD ] && echo "No head found" && return 1
	gh pr create -B staging --head $HEAD -t "${HEAD} -> staging"
}


# swapping vi for nvim
alias vi="nvim"

alias nvim-clean="NVIM_APPNAME=nvim-clean nvim"
alias nvim-k="NVIM_APPNAME=nvim nvim"
alias nvim-l="NVIM_APPNAME=nvim-l nvim"
alias nvim-test="NVIM_APPNAME=nvim-test nvim"

function nvims() {
	items=("default" "nvim-clean" "nvim-k" "nvim-l" "nvim-test")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"


alias av="workspacer -W=av"
alias ws="workspacer -W=ws"



