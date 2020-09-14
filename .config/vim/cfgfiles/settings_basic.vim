
" Backup, view, undo, swap
    if exists('$SUDO_USER')
        set nobackup                        " don't create root-owned files
        set nowritebackup                   " don't create root-owned files
    else
        set backup
        set undofile
        set backupskip=/tmp/*,/private/tmp/*"

        let $TMPFILESDIR = '/tmp/perers/vimtmp' " I do not want my tmp file in the vim dir
        set directory=$TMPFILESDIR
        set undodir=$TMPFILESDIR/undo
        set backupdir=$TMPFILESDIR/backup
        set viewdir=$TMPFILESDIR/view

        if !isdirectory(expand(&directory))
            call mkdir(expand(&directory), "p", 0777)
        endif
        if !isdirectory(expand(&undodir))
            call mkdir(expand(&undodir), "p", 0777)
        endif
        if !isdirectory(expand(&backupdir))
            call mkdir(expand(&backupdir), "p", 0777)
        endif
        if !isdirectory(expand(&viewdir))
            call mkdir(expand(&viewdir), "p", 0777)
        endif
    endif

    set noswapfile  " Never use swap files


" Encoding
    set fileencodings=utf-8
    set encoding=utf-8
    set fileformats=unix,mac,dos        "Handle Mac and DOS line-endings but prefer Unix endings




    filetype plugin indent on

    set formatoptions+=tcq
    set path+=**


    set showmode
    set showcmd
    set hidden
    set visualbell
    set ttyfast
    set backspace=indent,eol,start
    set laststatus=2
    set history=1000
    set undoreload=10000

    set matchtime=3
    set splitbelow
    set splitright
    set pastetoggle=<F2>
    set clipboard=unnamedplus
    set noautochdir

    set notimeout
    set ttimeout
    set ttimeoutlen=10

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

    " Highlight VCS conflict markers
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

" Wildmenu completion
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

