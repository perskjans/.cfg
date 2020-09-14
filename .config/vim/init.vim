
if !exists('$VIMDIR')
    let $VIMDIR = $HOME . '/.config/vim'
endif

let $MYVIMRC = $VIMDIR . '/init.vim'
let $CFGDIR = $VIMDIR . '/cfgfiles'
let $PLUGINSDIR = $VIMDIR . "/thirdpartyplugins"

set runtimepath+=$VIMDIR,$VIMDIR/after

"=====[ auto reload config if changed ]========
augroup vim_config_files
    au!
        au BufWritePost *vim/*.vim so $MYVIMRC
augroup END


so $CFGDIR/plugins.vim
so $CFGDIR/settings_basic.vim
so $CFGDIR/settings_visual.vim
so $CFGDIR/settings_folding.vim
so $CFGDIR/mappings_leader.vim
so $CFGDIR/mappings_normal.vim
so $CFGDIR/mappings_insert.vim
so $CFGDIR/mappings_visual.vim
so $CFGDIR/mappings_command.vim
"so $CFGDIR/colortheme.vim

color perskjans
