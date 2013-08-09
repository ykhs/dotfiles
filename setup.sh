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
ln -fsv ${dotfiles_dir}/zsh/zshrc $HOME/.zshrc
ln -fsv ${dotfiles_dir}/zsh/zshenv $HOME/.zshenv

if [ ! -d $HOME/.zsh ]; then
	mkdir $HOME/.zsh
fi

touch $HOME/.zsh/history
touch $HOME/.zsh/compdump

if [ -f ${dotfiles_dir}/zsh/zshrc.mine ]; then
	ln -fsv ${dotfiles_dir}/zsh/zshrc.mine $HOME/.zsh/zshrc.mine
fi

if [ -f ${dotfiles_dir}/zsh/zshenv.mine ]; then
	ln -fsv ${dotfiles_dir}/zsh/zshenv.mine $HOME/.zsh/zshenv.mine
fi

touch $HOME/.zsh/zshenv.local
touch $HOME/.zsh/zshrc.local

if [ -L $HOME/.zsh/antigen ]; then
	rm $HOME/.zsh/antigen
fi
ln -nsv ${dotfiles_dir}/zsh/antigen.git $HOME/.zsh/antigen
ln -fsv ${dotfiles_dir}/zsh/zshrc.antigen $HOME/.zsh/zshrc.antigen

# jshint
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/jshint/jshintrc $HOME/.jshintrc

# coffeelint
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/coffeelint/coffeelintrc $HOME/.coffeelintrc

