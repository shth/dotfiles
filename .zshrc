# If you come from bash you might have to change your $PATH.
# ZSH_THEME="spaceship"
# export PATH=$HOME/bin:/usr/local/bin:$PATH

### PATH ###

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# path for linuxbrew
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

# path for yarn globals
# export PATH="$(yarn global bin):$PATH"

export PATH="/usr/local/Cellar/git/2.22.0_1:$PATH"

# x server for vim to access system clipboard under wsl
export DISPLAY=localhost:0.0

export BROWSER="/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe"
######

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
eval `dircolors ~/dircolors.256dark`

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  extract
  web-search
  tmux
  colorize
)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# https://stackoverflow.com/questions/56716993/error-message-when-starting-vim-failed-to-set-locale-category-lc-numeric-to-en
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias ggraph="git log --all --decorate --oneline --graph"
alias gcfu="git commit --fixup"
alias a="alias"
alias yt="yarn test"
alias ycv="yarn coverage"
alias gcd="git checkout development"
alias grbiaq='grb -i --autosquash'
alias gifuckedup='gcfu HEAD; grbiaq HEAD~2'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip--"'
alias gcleanstalebranch="git remote prune origin"
alias gd="git d"
alias gdca="git d --cached"
alias zrc='vim ~/.zshrc'
alias fuckparcel='rm -r .cache/; yarn dev'
alias lla='ll -a'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# enable extended glob
setopt extendedglob

export REACT_EDITOR=code

# android studio
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_192`
# export ANDROID_HOME=/usr/local/opt/android-sdk

#nvm
useNvm() {
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

#nvm upgrade
#https://github.com/nvm-sh/nvm#manual-upgrade
alias upgrade_nvm='( cd "$NVM_DIR"; git fetch --tags origin; git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`) && . "$NVM_DIR/nvm.sh"'

#auto start ssh-agent
#https://docs.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
     (umask 077; ssh-agent >| "$env")
	 . "$env" >| /dev/null ; }

agent_load_env

agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
agent_start
 ssh-add
 elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
     ssh-add
     fi

unset env
 
#adding doom to PATH
export PATH="$HOME/.emacs.d/bin:$PATH"

