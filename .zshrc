# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="kolo"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx vi-mode z go svn)

source $ZSH/oh-my-zsh.sh

export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=vim
export CGO_ENABLED=0
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=/Users/semicarry/Development/go
# Customize to your needs...
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:~/Development/go/appengine:$GOPATH/bin:.:$PATH

alias about='cd ~/Development/go/src/myprojects/about'
alias ang='cd ~/Development/AngularJS/angular-phonecat'
export CASE_SENSITIVE=true

# The next line updates PATH for the Google Cloud SDK.
#source /Users/semicarry/Downloads/google-cloud-sdk/path.bash.inc

# The next line enables bash completion for gcloud.
#source /Users/semicarry/Downloads/google-cloud-sdk/completion.bash.inc
