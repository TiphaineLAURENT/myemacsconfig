#!/bin/sh

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install emacs

echo "Copying .emacs.d"
cp -vau emacs.d ~/.emacs.d
# echo "Copying site-list"
# sudo cp -vau site-lisp/* /usr/share/emacs/site-lisp/
