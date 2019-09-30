#!/bin/bash
git clone https://github.com/andrejv/maxima 
sudo apt-get install g++-mingw-w64-i686 cmake nsis wine automake texinfo rsync p7zip-full tcl-dev tk-dev texlive g++ libgl1-mesa-dev gettext
cd crosscompile-windows/build
cmake ..
make
make package
mv maxima /tmp
