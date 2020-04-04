#!/bin/sh


for dir in /.config /.cache /.local /tmp /rep $(grep -o '/.*"$' .config/user-dirs.dirs | tr '"\n' ' ')
do
    mkdir -p -m 755 $HOME$dir
done

for dir in Desktop Documents Downloads Music Pictures Public Templates Videos
do
    rm -rf $HOME/$dir
done

