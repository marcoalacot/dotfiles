# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PTCODE=/Volumes/Marco/code

# Aliases

# pT
base_platform=('/Volumes/Marco/code/platform')
base_code=('/Volumes/Marco/code/')

alias core="cd $base_platform/apps/core"
alias payschool="cd $base_platform/apps/payschool"
alias operations="cd $base_platform/apps/operations"
alias dashboard="cd $base_platform/apps/dashboards"
alias bank_router="cd $base_platform/apps/bank_router"
alias api="cd $base_platform/apps/api"
alias filer="cd $base_platform/apps/filer"
alias platform=$base_platform
alias infra="$base_platform/infra"
alias class_gateway="$base_platform/apps/class_gateway"
alias retrospecter="$base_code/retrospecter"

# General
alias code="cd /Volumes/Marco/code"

# Environment
alias dotfiles='cd ~/dotfiles'
alias vmruby='cd ~/dotfiles/vms/ruby'
alias gstats='cd /Volumes/Marco/code/github-stats'
alias sz='source ~/.zshrc'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias r='bin/rspec'

# Git
alias g='git status'
alias gau='git add -u' # Add deleted file deleting it from the index
alias gdc='git diff --cached'
alias gd='git diff'

# Tmux
alias tmux="tmux -2" # Force tmux to use 256 colors

# Enable vim mode
# set -o vi

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source ~/.fzf.zsh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# https://gist.github.com/msabramo/2355834
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}
