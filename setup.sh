dotfiles_dir=$(cd $(dirname $0);pwd)

# git
# ------------------------------------------------------------------------------
if [ -f ${dotfiles_dir}/git/gitignore ]; then
	ln -fsv ${dotfiles_dir}/git/gitignore $HOME/.gitignore
fi

if [ -f ${dotfiles_dir}/git/gitconfig ]; then
	ln -fsv ${dotfiles_dir}/git/gitconfig $HOME/.gitconfig
fi

# tmux
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/tmux/tmux.conf $HOME/.tmux.conf

# vim
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/vim/vimrc $HOME/.vimrc
ln -fsv ${dotfiles_dir}/vim/gvimrc $HOME/.gvimrc
if [ -L $HOME/.vim ]; then
	rm $HOME/.vim
fi
ln -fsv ${dotfiles_dir}/vim/vimfiles $HOME/.vim

# vimperator
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/vimperator/vimperatorrc $HOME/.vimperatorrc

# zsh
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/zsh/zshenv.zsh $HOME/.zshenv
ln -fsv ${dotfiles_dir}/zsh/zprofile.zsh $HOME/.zprofile
ln -fsv ${dotfiles_dir}/zsh/zshrc.zsh $HOME/.zshrc

if [ ! -d $HOME/.zsh ]; then
	mkdir $HOME/.zsh
fi

touch $HOME/.zsh/history
touch $HOME/.zsh/compdump

if [ -L $HOME/.zsh/completion ]; then
	rm $HOME/.zsh/completion
fi
ln -nsv ${dotfiles_dir}/zsh/completion $HOME/.zsh/completion

if [ -f ${dotfiles_dir}/zsh/tmuxinator.zsh ]; then
	ln -fsv ${dotfiles_dir}/zsh/tmuxinator.zsh $HOME/.zsh/tmuxinator.zsh
fi

# tig
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/tig/tigrc $HOME/.tigrc

# peco
# ------------------------------------------------------------------------------
if [ ! -d $HOME/.peco ]; then
	mkdir $HOME/.peco
fi
ln -fsv ${dotfiles_dir}/peco/config.json $HOME/.peco/config.json

# eslint
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/eslint/eslintrc.json $HOME/.eslintrc

