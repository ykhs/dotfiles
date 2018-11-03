if [ -f "$HOME/.zshrc.oh-my-zsh" ]; then
  DISABLE_AUTO_UPDATE=true
  source $HOME/.zshrc.oh-my-zsh
fi

fpath=($HOME/.zsh/completion $fpath)
export LANG=ja_JP.UTF-8
export EDITOR=vim

bindkey -e

# history
# ==============================================================================
setopt hist_ignore_all_dups
SAVEHIST=100000
HISTSIZE=100000

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
