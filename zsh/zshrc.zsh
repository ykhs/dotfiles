export ZSH=$HOME/.zsh
export LANG=ja_JP.UTF-8
export EDITOR=vim

bindkey -e

# Prompt
# ==============================================================================
autoload -U vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' max-exports 1
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{red}[+]%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}[!]%f'
zstyle ':vcs_info:git:*' formats '%c%u%F{blue}%b%f%F{black}@%r%f'
zstyle ':vcs_info:git:*' actionformats '%b@%r%c%u|%a'

function vcs_echo {
	LANG=C vcs_info
	if [[ -z "$vcs_info_msg_0_" ]]; then return; fi
	echo "%{$vcs_info_msg_0_%}"
}

unsetopt promptcr
setopt prompt_subst
setopt always_last_prompt

PROMPT='
%F{yellow}[%~]%f $(vcs_echo)
$ '

# History
# ==============================================================================
HISTFILE=$ZSH/history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
#bindkey '^R' history-incremental-pattern-search-backward
#bindkey '^S' history-incremental-pattern-search-forward

# walk history
# from: http://webtech-walker.com/archive/2008/12/15101251.html
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Complement
# ==============================================================================
fpath=($ZSH/completion $fpath)
autoload -U compinit
compinit -u
compinit -d $ZSH/compdump
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ""
zstyle ':completion:*:cd:*' ignore-parents parent pwd
setopt glob_complete

# recent dirs
# ==============================================================================
typeset -ga chpwd_functions
autoload -U chpwd_recent_dirs cdr
chpwd_functions+=chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-max 500
zstyle ":chpwd:*" recent-dirs-default true
zstyle ":completion:*" recent-dirs-insert always

# setopt
# ==============================================================================
setopt nobeep
setopt long_list_jobs
setopt list_types
setopt auto_resume
setopt auto_list
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt auto_menu
setopt equals
setopt magic_equal_subst
setopt numeric_glob_sort
setopt print_eight_bit
setopt auto_cd
setopt auto_param_keys
setopt auto_param_slash
setopt correct
setopt brace_ccl
setopt NO_flow_control
setopt interactive_comments
setopt mark_dirs
setopt list_packed
setopt noautoremoveslash

# peco
# ==============================================================================
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^@' peco-cdr

function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
zle -N peco-pkill
alias pk="peco-pkill"

# alias
# ==============================================================================
alias ls='ls -al'

alias o='git ls-files | peco | xargs open'
alias gh='gh-open $(ghq list -p | peco)'
alias v='git ls-files | peco | xargs mvim'
alias -g B='`git branch | peco | sed -e "s/^\*[ ]*//g"`'

alias gst='git status'
alias gco='git checkout'
alias ga='git add'
alias gc='git commit'

# tmuxinator
# ==============================================================================
if [ -f $ZSH/tmuxinator.zsh ]; then
	source $ZSH/tmuxinator.zsh
fi
