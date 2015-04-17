# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="random"
ZSH_THEME="steeef"

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
plugins=(git osx vi-mode z go svn brew)

source $ZSH/oh-my-zsh.sh

export MANPATH=/opt/local/share/man:$MANPATH
export EDITOR=vim
export CGO_ENABLED=0
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=~/Development/go
# Customize to your needs...
export PATH=.:/usr/local/sbin:/usr/local/Cellar/ruby/2.1.2_3/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:~/Development/go/appengine:$GOPATH/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home`
export CASE_SENSITIVE=true
export ZKROOT=~/Downloads/zookeeper-3.4.6

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

PERL_MB_OPT="--install_base \"~/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=~/perl5"; export PERL_MM_OPT;
export PERL5LIB=~/perl5/lib/perl5

#Add the following to your zshrc to access the online help:
unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/helpfiles
