#!/usr/bin/env bash

for file in $(ls | grep -E -i "^[0-9]_")
do
    newName="0$file"
    #echo "$file $newName"
    git mv $file $newName
done
