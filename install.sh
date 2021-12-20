PWD=$(pwd)

git submodule init
git submodule update

#bash
#rm -f ~/.bashrc
#ln -s $PWD/bash/bashrc ~/.bashrc

#zsh
rm -f ~/.zshrc
ln -s $PWD/zsh/zshrc ~/.zshrc

#git
rm -f ~/.gitconfig
ln -s $PWD/git/gitconfig ~/.gitconfig

#npm
rm -f ~/.npmrc
ln -s $PWD/npmrc ~/.npmrc

#debian
#rm -f ~/.quiltrc-dpkg
#ln -s $PWD/debian/quiltrc-dpkg ~/.quiltrc-dpkg

#vim
rm -f ~/.vimrc
rm -rf ~/.vim
ln -s $PWD/vim/vimrc ~/.vimrc
ln -s $PWD/vim ~/.vim

#mpd & ncmpcpp
#mkdir -p ~/.mpd ~/.ncmpcpp
#rm -f ~/.mpd/mpd.conf
#ln -s $PWD/mpd/mpd.conf ~/.mpd/mpd.conf
#rm -f ~/.ncmpcpp/config
#ln -s $PWD/mpd/ncmpcpp.config ~/.ncmpcpp/config

#awesome & xinit
#rm -f ~/.zlogin
#ln -s $PWD/zsh/zlogin ~/.zlogin
#mkdir -p ~/.config
#rm -rf ~/.xinitrc
#rm -rf ~/.Xresources
#rm -rf ~/.config/awesome
#ln -s $PWD/xinitrc ~/.xinitrc
#ln -s $PWD/Xresources ~/.Xresources
#ln -s $PWD/awesome ~/.config/awesome

#tmux
rm -rf ~/.tmux.conf
ln -s $PWD/tmux.conf ~/.tmux.conf

#dircolors
rm -rf ~/.dircolors
ln -s $PWD/dircolors/dircolors.ansi-dark ~/.dircolors
