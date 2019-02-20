# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER="koalic"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# all the repos works well, but the string is too long
ZSH_THEME="agnoster-short-zenburn"
#ZSH_THEME="agnoster"
#two strings, all repos are good, but changes are not seen
#ZSH_THEME="mikeh"
#short string, all repos are good, but changes are not seen
#ZSH_THEME="nicoulaj"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
 #DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial web-search pip python virtualenv systemd )

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=${PATH}:${HOME}/bin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
[[ -z "$TMUX" ]] && exec tmux

export PYTHONPATH=$HOME/gambles:$HOME/gambles/radar:$HOME/aspiranture/antenna/:$HOME/aspiranture/norad/:$HOME/aspiranture/norad/Pepelats
eval `dircolors $HOME/.config/dircolors-solarized/dircolors.ansi-universal`
#export TERM=rxvt-unicode-256color
export http_proxy=http://proxy-01.usr.rtimints.ojsc:3128
export https_proxy=http://proxy-01.usr.rtimints.ojsc:3128
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export STARDICT_DATA_DIR=$HOME/./config

#PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
ZSH_THEME_HG_PROMPT_PREFIX="%{$fg_bold[magenta]%}hg:(%{$fg[red]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN="%{$fg[magenta]%})"
xmodmap ~/.Xmodmap
