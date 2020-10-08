#!/bin/sh

for repo in \
    'git@github.com:perskjans/st.git suckless/st' \
    'git@github.com:perskjans/dmenu.git suckless/dmenu' \
    'git@github.com:perskjans/st.git suckless/slock' \
    'git@github.com:perskjans/dwm.git suckless/dwm' \
    'git@github.com:perskjans/lemonbar-xft.git lemonbar'
do
    [ ! -d ${repo#*\ } ] && p_gitutils clone $repo
done
