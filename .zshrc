# if you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/gbojinov/.oh-my-zsh
export TERM=xterm-256color
export PATH=$PATH:/usr/lib/javac
export PATH=$PATH:/home/gbojinov/.gem/ruby/2.4.0/bin

export PATH=$PATH:/home/gbojinov/.cache/rebar3/bin
 
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="crunch"

GEOMETRY_PROMPT_PLUGINS=(virtualenv git)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
else
export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias vi="vim"
alias g++="g++ -std=c++11"
alias py="python3"
alias rdm="vi README.md"
alias sl="ls --color=auto"
alias lls="ls --color=auto"
alias lss="ls --color=auto"
alias ls="ls --color=auto"
alias cwd="pwd"
alias nb="cd ~/netbeans-8.2/bin && ./netbeans"
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
# alias javac="/usr/lib/javac"

# SRC_DIRECTORY="$HOME/code/101-v5"
# venv () {
#     source $SRC_DIRECTORY/$1/$2/bin/activate;
# }

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

# for elixir
# export PATH="$PATH:/usr/bin/elixir"
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash
