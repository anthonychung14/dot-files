

@cp $(root_dir)/colors/candy.vim ~/.vim/colors/candy.vim
@cp $(root_dir)/vim/agignore ~/.agignore 

mkdir -p $(vim_bundle_dir)
git clone http://github.com/gmarik/vundle.git $(vundle)
vim +BundleInstall! +BundleClean +qall

link_files () {
  ln -s $1 $2
  echo "linked $1 to $2"
}

for source in `find $DOTFILES_ROOT -maxdepth 2 -name \*.symlink`
do
  dest="$HOME/.`basename \"${source%.*}\"`"

  if [ -f $dest ] || [ -d $dest ]
  then
    rm -rf $dest
    echo "removed $dest"
  fi

  link_files $source $dest
done

