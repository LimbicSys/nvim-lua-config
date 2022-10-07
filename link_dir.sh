#!/usr/bin/env bash

currentPath=`pwd`
ln -s $currentPath ~/.config/nvim

files=("tasks.ini")
link_targets_prefix=("${HOME}/.vim")

for ((i=0; i<${#files[@]}; i++))
do
    link_target=$HOME/${link_targets[$i]}

    file=$currentPath/${files[$i]}
    prefix=${link_targets_prefix[$i]}
    link_target=$prefix/${files[$i]}

    # echo $link_target $file
    if [ ! -d $prefix ]; then
        mkdir -p $prefix
    fi
    ln -s -f $file $link_target
done
