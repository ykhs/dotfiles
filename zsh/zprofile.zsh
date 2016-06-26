# MacVim
export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export GIT_EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim

# go
export GOPATH=$HOME/.go

# travis
if [ -f $HOME/.travis/travis.sh ]; then
  source $HOME/.travis/travis.sh
fi

# anyenv
if type anyenv >/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi

# direnv
if type direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# hub
if type hub > /dev/null 2>&1; then
	eval "$(hub alias -s)"
fi
