#!/bin/bash

# oh-my-zsh https://github.com/robbyrussell/oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# powerlevel9k https://github.com/bhilburn/powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# powerline fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.local/share/fonts/
mv "Hack Regular Nerd Font Complete.ttf" ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# ls solarized theme
wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark
mv dircolors.256dark ~/.dircolors

# emacs solarized color scheme
if [ ! -d  ~/.config/emacs/themes/emacs-color-theme-solarized ]
then
    git clone https://github.com/sellout/emacs-color-theme-solarized.git
    mkdir -p ~/.config/emacs/themes
    mv emacs-color-theme-solarized ~/.config/emacs/themes/
fi

# install spacemacs
git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
$(cd ~/.emacs.d && git checkout 56ae091b62af9b9d2da1d429700cc9fbce6b1720)

# zsh, tmux, and emacs configs
cp .spacemacs ~/.spacemacs
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf

# terminal solarized theme
# the following requires the dconf command, will fail if you don't have it
# Manual hex codes are:
# text color: #839496
# bold color: #93A1A1
# background color: #002B36
# pallete entry 1 - 16:
# #073642
# #DC322F
# #859900
# #B58900
# #268BD2
# #D33682
# #2AA198
# #EEE8D5
# #002B36
# #CB4B16
# #586E75
# #657B83
# #839496
# #6C71C4
# #93A1A1
# #FDF6E3
if [ 0 -eq 1 ]
then
    git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git
    chmod +x gnome-terminal-colors-solarized/set_dark.sh
    ./gnome-terminal-colors-solarized/set_dark.sh
    rm -rf gnome-terminal-colors-solarized
fi
