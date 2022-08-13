#! /bin/bash

echo Installing NVIM Config...

#Variables
N_CONFIG_DIR=$(mkdir -p ~/.config/nvim/; cd ~/.config/nvim; pwd)
N_CONFIG_INIT_VIM="${N_CONFIG_DIR}/init.vim"
N_CONFIG_INIT_LUA="${N_CONFIG_DIR}/init.lua"
N_CONFIG_LUA="${N_CONFIG_DIR}/lua"

if [ -e $N_CONFIG_INIT_VIM ] ; then
    echo "~/.config/nvim/init.vim already exists; backing up to init.vim.old"
    mv $N_CONFIG_INIT_VIM "${N_CONFIG_INIT_VIM}.old"
fi

if [ -e $N_CONFIG_INIT_LUA ] ; then
    echo "~/.config/nvim/init.lua already exists; backing up to init.lua.old"
    mv $N_CONFIG_INIT_LUA "${N_CONFIG_INIT_LUA}.old"
fi

if [ -d $N_CONFIG_LUA ] ; then
    echo "~/.config/nvim/lua already exists; backing up to lua-old"
    mv $N_CONFIG_LUA "${N_CONFIG_LUA}-old"
fi

echo Symlinking files...
ln -s $(pwd)/init.lua $N_CONFIG_INIT_LUA
ln -s $(pwd)/lua $N_CONFIG_LUA

printf "\nWARNING: Packer was added to config, but the script doesn't handle actual installation\n"
printf "https://github.com/wbthomason/packer.nvim#quickstart for installation info\n\n"

printf "Done\n"
