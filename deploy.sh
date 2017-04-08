#! /bin/sh

rm -rf ~/.config/bspwm
ln -s $(pwd)/bspwm/$(hostname) ~/.config/bspwm

rm -rf ~/.config/compton
ln -s $(pwd)/compton ~/.config/compton

rm -rf ~/.core
ln -s $(pwd)/core ~/.core

rm -rf ~/.config/dunst
ln -s $(pwd)/dunst ~/.config/dunst

rm -rf ~/.config/fish
ln -s $(pwd)/fish ~/.config/fish

rm -rf ~/.config/gtk-3.0
ln -s $(pwd)/gtk-3.0 ~/.config/gtk-3.0

rm -rf ~/.config/polybar 
ln -s $(pwd)/polybar/$(hostname) ~/.config/polybar 

rm -f ~/.ssh/config
ln -s $(pwd)/ssh/config ~/.ssh/config 

rm -rf ~/.config/sxkhkd
ln -s $(pwd)/sxkhkd ~/.config/sxkhkd

rm -rf ~/.termcolors
ln -s $(pwd)/termcolors ~/.termcolors

rm -f ~/.Xresources
ln -s $(pwd)/.Xresources ~/.Xresources

rm -f ~/.gitconfig
ln -s $(pwd)/.gitconfig ~/.gitconfig

rm -f ~/.gtk-2.0
ln -s $(pwd)/.gtk-2.0 ~/.gtk-2.0