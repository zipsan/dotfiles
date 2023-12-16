# NeoBundle
# mkdir -p ~/.vim/bundle
# git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install deno

# Vimproc
git clone https://github.com/Shougo/vimproc.vim ~/.vim/bundle/vimproc
cd ~/.vim/bundle/vimproc

if [ `uname` = "Darwin" ]; then
  make -f make_mac.mak 
elif [ `uname` = "Linux" ]; then
  make -f make_unix.mak
elif [ `uname` = "FreeBSD" ]; then
  gmake
fi

mkdir -p ~/dotfiles
ln -s ~/dotfiles/vimrc/vimrc ~/.vimrc

vim -c :PlugInstall

echo "Completed."
