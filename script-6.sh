#!/bin/bash
path=$1
for i in $(ls $path)
do
    if [[ -x $i ]]
    then
        echo "$i is having execution permission"
    else
        echo "$i is not having execution permission"
    fi
done