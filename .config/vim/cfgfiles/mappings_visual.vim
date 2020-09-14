
" Make BS/DEL work as expected in visual modes (i.e. delete the selected text).
    vmap <BS> x

"    " I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
"    " From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
"    vnoremap u <nop>
"    vnoremap gu u
