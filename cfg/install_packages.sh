#!/bin/sh

packages_to_install()
{
    case $DISTRO_TYPE in
    arch)
        #echo lightdm
        #echo lightdm-gtk-greeter
        echo alsa-utils
        echo arandr
        echo automake
        echo bash
        echo bash-completion
        echo diffutils
        echo dmenu
        echo dunst
        echo fossil
        echo gcc
        echo herbstluftwm
        echo jshon
        echo libnotify
        echo lxappearance
        #echo lxappearance-obconf
        echo make
        echo neovim
        echo network-manager-applet
        echo networkmanager
        echo noto-fonts
        echo noto-fonts-emoji
        echo papirus-icon-theme
        echo patch
        echo pavucontrol
        echo pkg-config
        echo scrot
        echo tmux
        echo trayer
        echo ttf-dejavu
        echo ttf-inconsolata
        echo ttf-liberation
        echo ttf-linux-libertine
        echo unzip
        echo vifm
        echo vim
        echo volumeicon
        echo wget
        echo xclip
        echo xorg-font-utils
        echo xorg-fonts-encodings
        echo xorg-twm
        echo xorg-xclock
        echo xorg-xinit
        echo xorg-xrandr
        echo xorg-xset
        echo xorg-xsetroot
        echo xterm
    ;;
    esac

}

#xorg-server-utils
#multilib-devel
#linux-headers catalyst-dkms catalyst-utils lib32-catalyst-utils
#nvidia lib32-nvidia-utils

[ -f ~/.config/profilefiles/platform_specific ] && . ~/.config/profilefiles/platform_specific

pi $(packages_to_install)

#case $DISTRO_TYPE in
#arch)
#    yay -S lemonbar-xft-git
#;;
#esac
