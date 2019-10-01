#!/bin/bash 
sudo apt-get install g++-mingw-w64-i686 cmake nsis wine automake texinfo rsync p7zip-full tcl-dev tk-dev texlive g++ libgl1-mesa-dev gettext
git clone https://github.com/andrejv/maxima 
cd maxima/crosscompile-windows/build
cmake ..
make
make package
cd ../../..
mv maxima /tmp
