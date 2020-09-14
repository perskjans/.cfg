" This file contains all plugin handling and setting of key mapping for
" pluggins. All other key mappings are set in the mappings_*.vim files.

" Call plug#begin()
" alternatively, pass a path where plug should install plugins
call plug#begin($PLUGINSDIR)

Plug 'guns/xterm-color-table.vim'

"Plug 'embear/vim-foldsearch'

"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-scripts/AutoComplPop'

Plug 'lilydjwg/colorizer'

"Plug 'yggdroot/indentline'

"Plug 'easymotion/vim-easymotion'

"Plug 'pangloss/vim-javascript'

"Plug 'leafgarland/typescript-vim'

"Plug 'elzr/vim-json'
"    "let g:vim_json_syntax_conceal = 0

"Plug 'frazrepo/vim-rainbow'
"    let g:rainbow_active = 1

"Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_map = '<leader>f'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_working_path_mode = 'rw'
    let g:ctrlp_show_hidden = 1

"Plug 'xuyuanp/nerdtree-git-plugin'

"Plug 'scrooloose/syntastic'

"Plug 'scrooloose/nerdtree'
"    nnoremap þ :NERDTreeToggle<cr>
"    let g:NERDTreeBookmarksFile = $P_VIMDATADIR . '/tmp/NERDTreeBookmarks'
"    let g:NERDTreeDirArrowExpandable = '+'
"    let g:NERDTreeDirArrowCollapsible = '-'
"    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"    "let NERDTreeHijackNetrw=1

"Plug 'tpope/vim-vinegar'
"    let g:netrw_home=$P_VIMDATADIR . '/tmp'
"    let g:netrw_banner=1 " Disable annoying banner
"    let g:netrw_browser_split=4 " Open in prior window
"    let g:netrw_altv=1 " Open splits to the right
"    let g:netrw_liststyle=3 " Tree view
"    "let g:netrw_list_hide=netrw_gitignore#Hide()
"    "let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

Plug 'tpope/vim-fugitive'

"Plug 'tpope/vim-commentary'

"Plug 'tpope/vim-surround'

"Plug 'richsoni/vim-ecliptic'

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    "let g:airline_powerline_fonts = 1


"Plug 'itchyny/lightline.vim'

"Plug 'msanders/snipmate.vim'

"Plug 'rhysd/vim-clang-format'

"Plug 'andviro/flake8-vim'
"    let g:PyFlakeOnWrite = 1
"    let g:PyFlakeCheckers = 'pep8'
"    let g:PyFlakeAggressive = 0

""Plug 'klen/python-mode'
"    "map <Leader>g :call RopeGotoDefinition()<CR>
"    "let ropevim_enable_shortcuts = 1
"    "let g:pymode_rope_goto_def_newwin = "vnew"
"    "let g:pymode_rope_extended_complete = 1
"    "let g:pymode_breakpoint = 1
"    "let g:pymode_sytax = 1
"    "let g:pymode_sytax_builtin_objs = 1
"    "let g:pymode_sytax_builtin_funcs = 1
"    "map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


"Plug 'ycm-core/YouCompleteMe'


"All of your Plugins must be added before the following line
call plug#end()            " required
