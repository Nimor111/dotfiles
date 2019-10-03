# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# dart stuff
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk

# PATH
export PATH=$PATH:/usr/bin/javac:$HOME/.gem/ruby/2.4.0/bin:/bin/stylish-haskell:$HOME/.cabal/bin:$HOME/.local/bin/:$GOPATH/bin:$HOME/.cargo/bin:$HOME/bin:$HOME/.cargo/bin/racer:$HOME/.pub-cache/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$JAVA_HOME/bin:$HOME/.rvm/bin:$HOME/idris-jvm/codegen/bin/

# custom motd
neofetch

# Set name of the theme to load.
ZSH_THEME="spaceship"

# spaceship prompt timestamps
export SPACESHIP_TIME_SHOW=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins
plugins=(git web-search copyfile zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
else
export EDITOR='vim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# ls colors
# LS_COLORS=$LS_COLORS:'di=1;32:' ; export LS_COLORS

# for jump
eval "$(jump shell zsh)"

# haskell shenanigans
# export PATH="$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH"

# Python virtualenvwrapper
export WORKON_HOME=~/Envs
source /usr/bin/virtualenvwrapper.sh

# Change to virtual env and jump to directory
# works 9/10 times
work() {
    workon $1 && j $1
}

# keep virtualennv when creating new zsh tabs
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate
fi

# same as above except for tmux
# TODO check if this breaks
if [[ -n "$TMUX" ]]; then
    tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
fi

# i'm afraid to delete this
autoload -Uz compinit
compinit

export GOPATH="$HOME/code/go"
export GOROOT="/usr/lib/go"

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export CATALINA_HOME=/usr/share/tomcat8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

# LS_COLORS
eval $(dircolors -b $HOME/.dircolors)

# kubectl auto-completion
if [ ! -z $(command -v kubectl) ]
then
source <(kubectl completion zsh)
complete -o default -F __start_kubectl k8s
fi

# set node js
nvs 10.14.2

# nix
source /home/gbojinov/.nix-profile/etc/profile.d/nix.sh
