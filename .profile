### START: general

    stty -ixon # Disable ctrl-s and ctrl-q

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    #shopt -s globstar

    #shopt -s autocd # Allows you to cd into directory merely by typing the directory name


### END: general

### START: aliases

#    [ -f ~/.config/profilefiles/exports ] && . ~/.config/profilefiles/exports
#    [ -f ~/.config/profilefiles/aliases ] && . ~/.config/profilefiles/aliases

### START: aliases


### START: Load rc file for current shell
    case $SHELL in
        *bash) [ -f $HOME/.bashrc ] && . $HOME/.bashrc ;;
    esac
### END: Load rc file for current shell


# Start xserver if on tty1 and not already running
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/den/null && exec startx $HOME/.config/X11/xinitrc
