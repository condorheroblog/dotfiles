# Signs to be installed 🚎
# 
# ┌───────────────────────┐
# │         THEME         │
# └───────────────────────┘
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME the default that Robby Russell uses.
# ZSH_THEME="robbyrussell"
#
# I use spaceship theme
#
# 🚎 git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
# ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
# install Powerline fonts: https://github.com/powerline/fonts
ZSH_THEME="spaceship"

# ┌───────────────────────┐
# │        PLUGINS        │
# └───────────────────────┘
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# git plugin: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# 🚎 git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# 🚎 git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# 🚎 git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

plugins=(
	git
  zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-z
)

# ┌───────────────────────┐
# │      oh-my-zsh        │
# └───────────────────────┘
# https://ohmyz.sh/
source $ZSH/oh-my-zsh.sh

# ┌───────────────────────┐
# │ Node Package Manager  │
# └───────────────────────┘
# https://github.com/antfu/ni
# 🚎 npm install -g ni

alias nio="ni --prefer-offline"
alias s="nr start"
alias d="nr dev"
alias b="nr build"
alias bw="nr build --watch"
alias t="nr test"
alias tu="nr test -u"
alias tw="nr test --watch"
alias w="nr watch"
alias p="nr play"
alias c="nr typecheck"
alias lint="nr lint"
alias lintf="nr lint --fix"
alias release="nr release"
alias re="nr release"

# ┌───────────────────────┐
# │         Git           │
# └───────────────────────┘

# Go to project root
alias grt='cd "$(git rev-parse --show-toplevel)"'

alias gs='git status'
alias gp='git push'
alias gpf='git push --force'
alias gpft='git push --follow-tags'
alias gpl='git pull --rebase'
alias gcl='git clone'
alias gst='git stash'
alias grm='git rm'
alias gmv='git mv'

alias main='git switch main'
alias dev='git switch dev'

alias gco='git checkout'
alias gcob='git checkout -b'
alias gsh='git switch'
alias gshc='git switch -c'

alias gb='git branch'
alias gbd='git branch -d'

alias grb='git rebase'
alias grbom='git rebase origin/master'
alias grbc='git rebase --continue'

alias gl='git log'
alias glo='git log --oneline --graph'

alias grh='git reset HEAD'
alias grh1='git reset HEAD~1'

alias ga='git add'
alias gA='git add -A'

alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git add -A && git commit -m'
alias gfrb='git fetch origin && git rebase origin/master'

alias gxn='git clean -dn'
alias gx='git clean -df'

alias gsha='git rev-parse HEAD | pbcopy'

# 🚎 brew install gh
alias ghci='gh run list -L 1'

# The latest x commit logs
function glp() {
  git --no-pager log -$1
}

function gd() {
  if [[ -z $1 ]] then
    git diff --color | diff-so-fancy
  else
    git diff --color $1 | diff-so-fancy
  fi
}

function gdc() {
  if [[ -z $1 ]] then
    git diff --color --cached | diff-so-fancy
  else
    git diff --color --cached $1 | diff-so-fancy
  fi
}

# ┌───────────────────────┐
# │     Directories       │
# └───────────────────────┘
# 
# I put
# `~/i` for my GitHub projects
# `~/f` for forks
# `~/c` for my company projects

function i() {
  cd ~/i/$1
}

function company() {
  cd ~/c/$1
}

function forks() {
  cd ~/f/$1
}

function pr() {
  if [ $1 = "ls" ]; then
    gh pr list
  else
    gh pr checkout $1
  fi
}

function dir() {
  mkdir $1 && cd $1
}

function clone() {
  if [[ -z $2 ]] then
    git clone "$@" && cd "$(basename "$1" .git)"
  else
    git clone "$@" && cd "$2"
  fi
}

# Clone to ~/i and cd to it
function clonei() {
  i && clone "$@" && code . && cd ~2
}

function clonec() {
  company && clone "$@" && code . && cd ~2
}

function clonef() {
  forks && clone "$@" && code . && cd ~2
}

function codei() {
  forks && code "$@" && cd -
}

function codec() {
  company && code "$@" && cd -
}

function codef() {
  f && code "$@" && cd -
}

# 🚎 brew install live-server
function serve() {
  if [[ -z $1 ]] then
    live-server dist
  else
    live-server $1
  fi
}
