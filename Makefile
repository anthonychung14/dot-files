root_dir := $(shell pwd)
vim_bundle_dir = $(HOME)/.vim/bundle
vundle = $(HOME)/.vim/bundle/vundle
dotfiles = $(HOME)/.dotfiles
vimrc = $(HOME)/.vimrc

def:
	rm -rf $(vim_bundle_dir)
	@cp $(root_dir)/vim/agignore ~/.agignore
	@cp $(root_dir)/colors/candy.vim ~/.vim/colors/candy.vim
	git clone http://github.com/gmarik/vundle.git $(vundle)
	vim +PluginInstall +qall
	ls -l $(root_dir)/scripts/symlink_dotfiles
	$(root_dir)/scripts/symlink_dotfiles
	mkdir -p $(vim_bundle_dir)



# cp $(root_dir)/colors/candy.vim ~/.vim/colors/candy.vim