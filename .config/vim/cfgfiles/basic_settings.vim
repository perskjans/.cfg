

" BASIC OPTIONS------------------------------------------------------------- {{{

syntax on
set backup
set noswapfile

set directory=$TMPFILESDIR/swap         "
set undodir=$TMPFILESDIR/undo           "
set backupdir=$TMPFILESDIR/backup       "
set viewdir=$TMPFILESDIR/view           "

set backupskip=/tmp/*,/private/tmp/*"   " No backup for temp files.

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

filetype plugin indent on

set path+=**
set modelines=0

set termguicolors
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set history=1000
set undofile
set undoreload=10000
set lazyredraw
set matchtime=3
set splitbelow
set splitright
set ff=unix
set cursorline
set number
set relativenumber
set pastetoggle=<F2>
"set clipboard=unnamedplus
set autoindent  "Retain indentation on next line
set smartindent "Turn on autoindenting of blocks
set noautochdir

set notimeout
set ttimeout
set ttimeoutlen=10

set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set shell=sh                          " shell to use for `!`, `:!`, `system()` etc.
set sidescroll=0                      " sidescroll in jumps because terminals are slow
set sidescrolloff=3                   " same as scrolloff, but for columns

" set complete=.,w,b,u,tBetter Completion
set complete=.,w,b,u,t
set completeopt=menuone,longest,preview

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

"=====[ Setglobal relativenumber ]=====
autocmd WinEnter * :setlocal relativenumber
autocmd WinLeave,FocusLost * :setlocal number norelativenumber
autocmd InsertEnter * :setlocal number
autocmd InsertLeave * :setlocal relativenumber

" Highlight VCS conflict marker"s
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Open Quickfix window automatically after running :make
augroup OpenQuickfixWindowAfterMake
    autocmd!
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
    autocmd FileType qf wincmd J
augroup END


"Square up visual selections...
set virtualedit=block

"=====[ Miscellaneous features (mainly options) ]=====================

set title           "Show filename in titlebar of window
set titleold=

set nomore          "Don't page long listings

set autowrite       "Save buffer automatically when changing files
set autoread        "Always reload buffer when external changes detected


"           +--Disable hlsearch while loading viminfo
"           | +--Remember marks for last 500 files
"           | |    +--Remember up to 10000 lines in each register
"           | |    |      +--Remember up to 1MB in each register
"           | |    |      |     +--Remember last 1000 search patterns
"           | |    |      |     |     +---Remember last 1000 commands
"           | |    |      |     |     |
"           v v    v      v     v     v
set viminfo=h,'500,<10000,s1000,/1000,:1000,n$TMPFILESDIR/viminfo

                                    "     and even the start of insertion

set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings but prefer Unix endings


set infercase                       "Adjust completions to match case

set showmode                        "Show mode change messages
set modelines=2                     "Always show mode

set updatecount=10                  "Save buffer every 10 chars typed


" Keycodes and maps timeout in 3/10 sec...
set timeout timeoutlen=300 ttimeoutlen=300


" Spelling
"
" There are three dictionaries I use for spellchecking:
"
"   /usr/share/dict/words
"   Basic stuff.
"
"   ~/.vim/custom-dictionary.utf-8.add
"   Custom words (like my name).  This is in my (version-controlled) dotfiles.
"
"   ~/.vim-local-dictionary.utf-8.add
"   More custom words.  This is *not* version controlled, so I can stick
"   work stuff in here without leaking internal names and shit.
"
" I also remap zG to add to the local dict (vanilla zG is useless anyway).
set dictionary=/usr/share/dict/words
"set spellfile=~/.vim/custom-dictionary.utf-8.add,~/.vim/local-dictionary.utf-8.add
nnoremap zG 2zg

"=====[ Correct common mistypings in-the-fly ]=======================

iab     flase  false
iab    retrun  return
iab     pritn  print
iab       teh  the
iab      liek  like
iab        ;t  't
iab      moer  more
iab  previosu  previous

" END ---------------------------------------------------------------------- }}}

" Wildmenu completion {{{

set wildmenu
set wildmode=list:longest,full      "Show list of completions and complete as much as possible, then iterate full completions

set wildignore+=*/tmp/*,*.so,*.swp,*.zip           " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.bak  " Windows
set wildignore+=.hg,.git,.svn,*.fossil             " Version control
set wildignore+=*.aux,*.out,*.toc                  " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg     " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest   " compiled object files
set wildignore+=*.spl                              " compiled spelling word lists
set wildignore+=*.DS_Store                         " OSX bullshit

set wildignore+=*.luac                             " Lua byte code

set wildignore+=migrations                         " Django migrations
set wildignore+=*.pyc                              " Python byte code

set wildignore+=*.orig                             " Merge resolution files
set wildignore+=bin                                " files in bin folder
set wildignore+=nbproject                          " Netbeans project folder
set wildignore+=external                           " folders for external dependecies
" }}}

" Tabs, spaces, wrapping {{{

set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else
set softtabstop=4
set expandtab
set wrap
"set textwidth=80
set formatoptions+=tcq
set colorcolumn=81
" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.^
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}

" GRAPHICAL SETTINGS ------------------------------------------------------- {{{

"====[ Toggle visibility of naughty characters ]============

" Make naughty characters visible...
set list
"set showbreak=↪
"set listchars=tab:▸-▸,extends:❯,precedes:❮,trail:«,nbsp:»
",eol:¬,

set showbreak=.^.
set listchars=tab:>~,extends:>,precedes:<,trail:^,nbsp:~
",eol:


" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set list!
    au InsertLeave * :set list!
augroup END


augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
    autocmd BufEnter  *.log   set nolist
    autocmd BufEnter  *.txt   set nolist
    autocmd BufEnter  *.vp*   set nolist
    autocmd BufEnter  *       if !&modifiable
    autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END


" END ---------------------------------------------------------------------- }}}
