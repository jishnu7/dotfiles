PWD=$(pwd)

#bash
rm -f ~/.bashrc
ln -s $PWD/bash/bashrc ~/.bashrc

#zsh
rm -f ~/.zshrc
ln -s $PWD/zsh/zshrc ~/.zshrc

#git
rm -f ~/.gitconfig
ln -s $PWD/git/gitconfig ~/.gitconfig

#debian
rm -f ~/.quiltrc-dpkg
ln -s $PWD/debian/quiltrc-dpkg ~/.quiltrc-dpkg

#vim
rm -f ~/.vimrc
rm -rf ~/.vim
ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim ~/.vim

#terminator
rm -rf ~/.config/terminator
ln -s $PWD/terminator ~/.config/terminator
