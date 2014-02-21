#!/bin/bash

cd ~/Library/Application\ Support/Sublime\ Text\ 2/
rm -r Installed\ Packages
rm -r Packages
rm -r Pristine\ Packages

ln -s ~/Dropbox/Settings/Sublime\ Text\ 2/Installed\ Packages/ ./Installed\ Packages
ln -s ~/Dropbox/Settings/Sublime\ Text\ 2/Packages/ ./Packages
ln -s ~/Dropbox/Settings/Sublime\ Text\ 2/Pristine\ Packages/ ./Pristine\ Packages
sudo ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /bin/subl

cd
