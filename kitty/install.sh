#! /bin/bash

echo Installing Kitty Config...

# Variables
# Commands below won't accept path with home in it; expand it to full path
# In the subshell, create dir (won't fail if already exists), 
# change into the kitty config folder, get the path string
K_CONFIG_DIR=$(mkdir -p ~/.config/kitty/; cd ~/.config/kitty/; pwd)
K_CONFIG="${K_CONFIG_DIR}/kitty.conf" # Double quotes allow for string interpolation

if [ ! -e $K_CONFIG ]; then
    echo "~/.config/kitty/kitty.conf doesn't exist; Creating an empty file..."
    touch $K_CONFIG
fi

echo Symlinking config...
ln -s $(pwd)/andrey-config $K_CONFIG_DIR

# Add a line to include andrey.conf in kitty.conf, if there isn't one already
if ! grep --line-regexp --quiet "^include andrey-config/andrey.conf$" $K_CONFIG ; then
    echo "Adding custom include in kitty.conf..."
    printf "\n\n# Custom conf, installed using custom shell script\n" >> $K_CONFIG
    printf "include andrey-config/andrey.conf" >> $K_CONFIG
fi

echo Done
