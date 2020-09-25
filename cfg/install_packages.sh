#!/bin/sh

packages_to_install()
{
    case $DISTRO_TYPE in
    arch)
        echo alsa-utils
        echo arandr
        echo automake
        echo bash
        echo bash-completion
        echo diffutils
        echo dunst
        echo fossil
        echo gcc
        echo herbstluftwm
        echo jshon
        echo libnotify
        echo libvirt
        echo make
        echo mpv
        echo neovim
        echo network-manager-applet
        echo networkmanager
        echo nnn
        echo noto-fonts
        echo noto-fonts-emoji
        echo openssh
        echo openssl
        echo papirus-icon-theme
        echo patch
        echo pavucontrol
        echo pulseadio
        echo pulsemixer
        echo qemu
        echo sxhkd
        echo tmux
        echo transmission-cli
        echo trayer
        echo ttf-dejavu
        echo ttf-inconsolata
        echo ttf-liberation
        echo ttf-linux-libertine
        echo unzip
        echo virt-manager
        echo volumeicon
        echo wget
        echo xbacklight
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

pi $(packages_to_install)
