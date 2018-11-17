dotfiles_dir=$(cd $(dirname $0);pwd)

# tmux
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/tmux/tmux.conf $HOME/.tmux.conf

# vim
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/vim/vimrc.vimrc $HOME/.vimrc
ln -fsv ${dotfiles_dir}/vim/gvimrc.vimrc $HOME/.gvimrc
if [ -L $HOME/.vim ]; then
	rm $HOME/.vim
fi
ln -fsv ${dotfiles_dir}/vim/vimfiles $HOME/.vim

if [ ! -d $HOME/.vim_undo ]; then
	mkdir $HOME/.vim_undo
fi

# vimperator
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/vimperator/vimperatorrc $HOME/.vimperatorrc

# zsh
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/zsh/zshenv.zsh $HOME/.zshenv
ln -fsv ${dotfiles_dir}/zsh/zshrc.zsh $HOME/.zshrc
ln -fsv ${dotfiles_dir}/aliases $HOME/.aliases

# omz
ln -fsv ${dotfiles_dir}/zsh/zshrc.oh-my-zsh.zsh $HOME/.zshrc.oh-my-zsh
ln -fsv ${dotfiles_dir}/oh-my-zsh $HOME/.oh-my-zsh

if [ ! -d $HOME/.zsh ]; then
	mkdir $HOME/.zsh
fi

touch $HOME/.zsh/history
touch $HOME/.zsh/compdump

ln -fnsv ${dotfiles_dir}/zsh/completion $HOME/.zsh/completion
ln -fnsv ${dotfiles_dir}/zsh/functions $HOME/.zsh/functions
ln -fnsv ${dotfiles_dir}/zsh/init $HOME/.zsh/init

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

# Atom
# ------------------------------------------------------------------------------
ln -fsv ${dotfiles_dir}/atom/config.cson $HOME/.atom/config.cson
ln -fsv ${dotfiles_dir}/atom/init.coffee $HOME/.atom/init.coffee
ln -fsv ${dotfiles_dir}/atom/keymap.cson $HOME/.atom/keymap.cson
ln -fsv ${dotfiles_dir}/atom/snippets.cson $HOME/.atom/snippets.cson
ln -fsv ${dotfiles_dir}/atom/styles.less $HOME/.atom/styles.less
