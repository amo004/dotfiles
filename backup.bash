#!/bin/bash

apt list --installed > $HOME/.config/dotfiles/apt.inst
pip list > $HOME/.config/dotfiles/pip.inst
pip3 list > $HOME/.config/dotfiles/pip3.inst

rsync -a $HOME --files-from $HOME/.config/dotfiles/f.txt $HOME/.config/dotfiles
