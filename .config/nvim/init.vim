set fileencodings=utf-8
set encoding=utf-8

let $myvimdir = $HOME . "/.config/nvim"
let $datadir = $HOME . "/.local/share/vim"

let $MYVIMRC = $myvimdir . "/init.vim"
let $workman = $myvimdir . "/workman.vim"
let $cfgfile = $myvimdir . "/cfg.vim"
let $pluginsdir = $datadir . "/plugins"
let $tmpdir = $datadir . "/tmp"

set runtimepath+=$myvimdir,$myvimdir"/after"

let $mycolorfile=$myvimdir . '/colors/perskjans.vim'

"=====[ auto reload config if changed ]========
augroup myvimrc
    au!
        au BufWritePost .vimrc so $MYVIMRC
        au BufWritePost init.vim so $MYVIMRC
augroup END


nnoremap <silent> <leader>0 :mapclear<cr>:imapclear<cr>:so $MYVIMRC<cr>
autocmd BufWritePost *vim/colors/* so %

" Open vimrc
nnoremap <F3> :e $MYVIMRC<cr>:e $cfgfile<cr>

syntax on
set backup
set noswapfile

set directory=$datadir/swap
set undodir=$datadir/undo
set backupdir=$datadir/backup
set viewdir=$datadir/view
set viminfo+='1000,n$datadir/viminfo

set backupskip=/tmp/*,/private/tmp/*"

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&viewdir))
    call mkdir(expand(&viewdir), "p")
endif

" path to include Vundle and initialize

" Call plug#begin()
" alternatively, pass a path where plug should install plugins
call plug#begin($pluginsdir)

Plug 'guns/xterm-color-table.vim'

Plug 'embear/vim-foldsearch'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-scripts/AutoComplPop'

Plug 'lilydjwg/colorizer'

Plug 'yggdroot/indentline'

Plug 'easymotion/vim-easymotion'

Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

Plug 'elzr/vim-json'
    "let g:vim_json_syntax_conceal = 0

Plug 'frazrepo/vim-rainbow'
    let g:rainbow_active = 1

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<leader>f'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_working_path_mode = 'rw'
    let g:ctrlp_show_hidden = 1

Plug 'xuyuanp/nerdtree-git-plugin'

Plug 'scrooloose/syntastic'

Plug 'scrooloose/nerdtree'
    let g:NERDTreeBookmarksFile = $tmpdir . '/NERDTreeBookmarks'
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '-'
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeHijackNetrw=1

"Plug 'tpope/vim-vinegar'
    let g:netrw_home=$tmpdir
    let g:netrw_banner=1 " Disable annoying banner
    let g:netrw_browser_split=4 " Open in prior window
    let g:netrw_altv=1 " Open splits to the right
    let g:netrw_liststyle=3 " Tree view
    "let g:netrw_list_hide=netrw_gitignore#Hide()
    "let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

Plug 'richsoni/vim-ecliptic'

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline_powerline_fonts = 1

    "
"Plug 'itchyny/lightline.vim'

"Plug 'msanders/snipmate.vim'

"Plug 'rhysd/vim-clang-format'

Plug 'andviro/flake8-vim'
    let g:PyFlakeOnWrite = 1
    let g:PyFlakeCheckers = 'pep8'
    let g:PyFlakeAggressive = 0

"Plug 'klen/python-mode'
    "map <Leader>g :call RopeGotoDefinition()<CR>
    "let ropevim_enable_shortcuts = 1
    "let g:pymode_rope_goto_def_newwin = "vnew"
    "let g:pymode_rope_extended_complete = 1
    "let g:pymode_breakpoint = 1
    "let g:pymode_sytax = 1
    "let g:pymode_sytax_builtin_objs = 1
    "let g:pymode_sytax_builtin_funcs = 1
    "map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


"Plug 'ycm-core/YouCompleteMe'


"All of your Plugins must be added before the following line
call plug#end()            " required


" Put your non-Plugin stuff after this line


" END ---------------------------------------------------------------------- }}}


" Source file with congfig
so $cfgfile
