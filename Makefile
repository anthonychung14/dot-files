root_dir := $(shell pwd)
vim_bundle_dir = $(HOME)/.vim/bundle
vundle = $(HOME)/.vim/bundle/vundle
dotfiles = $(HOME)/.dotfiles
vimrc = $(HOME)/.vimrc

def:
	whoami
	rm -rf $(vim_bundle_dir)	
	@cp $(root_dir)/colors/candy.vim ~/.vim/colors/candy.vim
	@cp $(root_dir)/vim/agignore ~/.agignore 
	$(root_dir)/scripts/symlink_dotfiles
	mkdir -p $(vim_bundle_dir)
	git clone http://github.com/gmarik/vundle.git $(vundle)
	vim +BundleInstall! +BundleClean +qall






