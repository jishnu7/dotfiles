PWD=$(pwd)

git submodule init
git submodule update
touch secrets

#bash
#rm -f ~/.bashrc
#ln -s $PWD/bash/bashrc ~/.bashrc

#zsh
rm -f ~/.zshrc
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $PWD/zsh/p10k.zsh ~/.p10k.zsh

# Add OhMyZsh plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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
vim +'PlugInstall --sync' +qa

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
ln -s $PWD/tmux ~/.tmux

#dircolors
rm -rf ~/.dircolors
ln -s $PWD/dircolors/dircolors.ansi-dark ~/.dircolors

# Arch Packages
#sudo pacman -S ttf-meslo-nerd-font-powerlevel10k nodejs tmux

# MacOS
# Disabled 'last login' greeter
touch ~/.hushlogin
# Packages
brew install --cask iterm2 numi keyman dozer rectangle libreoffice gimp inkscape
brew install tmux wget htop tree fnm
brew install --cask homebrew/cask-fonts/font-inconsolata-for-powerline
