# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM=rxvt-unicode-256color
export PATH=$PATH:/usr/bin/javac
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
export PATH=$PATH:/bin/stylish-haskell

export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin/racer

# custom motd
cowsay "Hello there!"
neofetch

# Set name of the theme to load.
ZSH_THEME="crunch"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins
plugins=(git)

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

export RUST_SRC_PATH="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"

export PYTHONPATH="$HOME/code/DataScience/ThinkStats/:$HOME/code/DataScience/ThinkStats/utils:$HOME/code/Python/Adventure:$HOME/code/Python/RoguelikeLibtcod/tutorial"

export JAVA_HOME="$(which java)"
export PATH=$PATH:$JAVA_HOME/bin
export CATALINA_HOME=/usr/share/tomcat8

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

# LS_COLORS
eval $(dircolors -b $HOME/.dircolors)

# nodejs
export PATH=$PATH:~/.nvs/node/11.10.0/x64/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# kubectl auto-completion
source <(kubectl completion zsh)
complete -o default -F __start_kubectl k8s

