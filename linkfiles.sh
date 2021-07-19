#!/bin/bash

# XDG_CONFIG_HOME="${HOME}/.config/nvim-lua"
currentPath=`pwd`

files=("init.lua" "lua/" "ftplugin/")
# link_targets_prefix=("${XDG_CONFIG_HOME}" "${XDG_CONFIG_HOME}" "${XDG_CONFIG_HOME}")

# echo ${#files[@]}
for ((i=0; i<${#files[@]}; i++))
do
    # link_target=$HOME/${link_targets[$i]}

    file=$currentPath/${files[$i]}
    prefix=$HOME/.config/nvim
    link_target=$prefix/${files[$i]}
    if [[ ${files[$i]} == 'ftplugin/' || ${files[$i]} == 'lua/' ]]; then
        link_target=$prefix
    fi
    if [ ! -d $prefix ]; then
        mkdir -p $prefix
    fi
    ln -s -f $file $link_target
    echo "${file} -> ${link_target}"
done
