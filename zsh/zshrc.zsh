# zgen
# ==============================================================================
if [[ -f "$HOME/.zgen/zgen.zsh" ]]; then
  # load zgen
  source "$HOME/.zgen/zgen.zsh"

  if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh themes/ys

    zgen load zsh-users/zsh-completions
    zgen load zsh-users/zsh-syntax-highlighting

    zgen save
  fi
fi

# general
# ==============================================================================
fpath=($HOME/.zsh/completion $fpath)
export LANG=ja_JP.UTF-8
export EDITOR=vim

bindkey -e

# 補完候補に色を付ける
zstyle ':completion:*' list-colors "${LS_COLORS}"

# history
# ==============================================================================
SAVEHIST=100000
HISTSIZE=100000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_no_store

# functions
# ==============================================================================
for function in $HOME/.zsh/functions/*.sh; do
  source "$function"
done

# init
# ==============================================================================
for init in $HOME/.zsh/init/*.sh; do
  source "$init"
done

# aliases
# ==============================================================================
source $HOME/.aliases

# local
# ==============================================================================
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
