" Indentation
    set autoindent     "Retain indentation on next line
    set smartindent    "Turn on autoindenting of blocks
    set tabstop=4      "Tab indentation levels every four columns
    set shiftwidth=4   "Indent/outdent by four columns
    set expandtab      "Convert all tabs that are typed into spaces
    set shiftround     "Always indent/outdent to nearest tabstop
    set smarttab       "Use shiftwidths at left margin, tabstops everywhere else
    set softtabstop=4

" Color column
    set colorcolumn=80
    " Don't try to highlight lines longer than 800 characters.
    set synmaxcol=800

    "set wrap
    "set textwidth=80


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

    syntax on
    set termguicolors
    set ruler
    set lazyredraw
    set cursorline
    set number
    set relativenumber

    " Only show cursorline in the current window and in normal mode.^
    augroup cline
        autocmd!
        autocmd WinLeave,InsertEnter * set nocursorline
        autocmd WinEnter,InsertLeave * set cursorline
    augroup END
