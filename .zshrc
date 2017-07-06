# Path to your oh-my-zsh installation.
export ZSH=/home/gbojinov/.oh-my-zsh
export TERM=xterm-256color
export PATH=$PATH:/usr/lib/javac
export PATH=$PATH:/home/gbojinov/.gem/ruby/2.4.0/bin

export PATH=$PATH:/home/gbojinov/.cache/rebar3/bin
 
# Set name of the theme to load. 
ZSH_THEME="crunch"

GEOMETRY_PROMPT_PLUGINS=(virtualenv git)

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

# personal aliases
alias vi="vim"
alias g++="g++ -std=c++11"
alias py="python3"
alias rdm="vi README.md"
alias sl="ls --color=auto"
alias lls="ls --color=auto"
alias lss="ls --color=auto"
alias ls="ls --color=auto"
alias cwd="pwd"
alias лс="ls"
alias цд="cd"
alias жи="vi"
alias pw="poweroff"
alias ghcc="ghc -o exe --make"
alias pmr="python manage.py runserver"
alias pms="python manage.py shell"
alias pmm="python manage.py migrate"
alias pmmm="python manage.py makemigrations"
alias pmt="python manage.py test"
alias nb="cd ~/netbeans-8.2/bin/ && ./netbeans"
alias viconf="vi ~/.vimrc"
alias zshconf="vi ~/.zshrc"
alias plovdiv="pwd"
alias c="clear"

# ls colors
LS_COLORS=$LS_COLORS:'di=1;32:' ; export LS_COLORS

# for jump
eval "$(jump shell zsh)"

# haskell shenanigans
export PATH="$HOME/.cabal/bin:/opt/cabal/1.22/bin:/opt/ghc/7.10.3/bin:$PATH"

# for working python imports $PYTHONPATH:/home/gbojinov/code/101-v5/week10/Cinema:
export PYTHONPATH=$PYTHONPATH:/home/gmbojinov/code/101-v5/week12/Snake/
export PYTHONPATH=$PYTHONPATH:/home/gmbojinov/code/101-v5/week13/HomemadeORM/
export PYTHONPATH=$PYTHONPATH:/home/gmbojinov/code/Adventure/

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
    source $VIRTUAL_ENV/bin/activate;
fi

# same as above except for tmux
# TODO check if this breaks
if [[ -n "$TMUX" ]]; then
    tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
fi

# i'm afraid to delete this
autoload -Uz compinit
compinit
