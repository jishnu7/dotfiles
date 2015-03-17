PWD=$(pwd)

git submodule init
git submodule update

#bash
rm -f ~/.bashrc
ln -s $PWD/bash/bashrc ~/.bashrc

#zsh
rm -f ~/.zshrc
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/zsh/zlogin ~/.zlogin

#git
rm -f ~/.gitconfig
ln -s $PWD/git/gitconfig ~/.gitconfig

#npm
rm -f ~/.npmrc
ln -s $PWD/npmrc ~/.npmrc

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

#mpd & ncmpcpp
mkdir -p ~/.mpd ~/.ncmpp
rm -f ~/.mpd/mpd.conf
ln -s $PWD/mpd/mpd.conf ~/.mpd/mpd.conf
rm -f ~/.ncmpcpp/config
ln -s $PWD/mpd/ncmpcpp.config ~/.ncmpcpp/config

#mount
rm -f ~/.mount_data
ln -s $PWD/mount_data ~/.mount_data
