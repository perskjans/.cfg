"=====[ auto reload config if changed ]========
augroup myvimrc
    au!
        au BufWritePost cfg.vim so $cfgfile
augroup END

" BASIC OPTIONS------------------------------------------------------------- {{{

" required
"filetype plugin indent on
" To ignore plugin indent changes, instead use:
filetype plugin on

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

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Open Quickfix window automatically after running :make
augroup OpenQuickfixWindowAfterMake
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
set viminfo=h,'500,<10000,s1000,/1000,:1000

set backspace=indent,eol,start      "BS past autoindents, line boundaries,
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

" END ---------------------------------------------------------------------- }}}

" GRAPHICAL SETTINGS ------------------------------------------------------- {{{

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

"====[ Toggle visibility of naughty characters ]============

" Make naughty characters visible...
set list
"set showbreak=↪
"set listchars=tab:▸-▸,extends:❯,precedes:❮,trail:«,nbsp:»
",eol:¬,

set showbreak=.^.
set listchars=tab:>~,extends:>,precedes:<,trail:^,nbsp:~
",eol:


" Trailing {{{
" Only shown when not in insert mode so I don't go insane.

augroup trailing
    au!
    au InsertEnter * :set list!
    au InsertLeave * :set list!
augroup END

" }}}


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

" KEY MAPPING -------------------------------------------------------------- {{{
    " Leader
    "let mapleader = "-"
    "let maplocalleader = "_"

    noremap ; :
    nnoremap : ;


    " Move between open buffers
    nnoremap <A-h> :bp<CR>
    nnoremap <A-l> :bn<CR>
    nnoremap <A-o> :bn<CR>


    " === Movement ===

    nnoremap <C-n> <C-y> " Scroll down

    nnoremap ä <C-u> " Half page up
    nnoremap Ä <C-b> " Full page up
    nnoremap ç <C-d> " Half page down
    nnoremap Ç <C-f> " Full page down

    nnoremap <A-n> jzz
    nnoremap <A-e> kzz
    nnoremap ñ j
    nnoremap é k
    nnoremap Ñ }zz
    nnoremap É {zz

    nnoremap ó l

    " Splits
    nnoremap gv <C-w>v
    nnoremap gvv <C-w>s
    nnoremap <leader>v <C-w>v
    nnoremap <leader>vv <C-w>s

    " move between splits
    nnoremap gk  <C-W>k
    nnoremap gj  <C-W>j
    nnoremap gh  <C-W>h
    nnoremap gl  <C-W>l
    "
" Resize vertical window
nnoremap <silent> <leader>1 :vertical resize +2<cr>
nnoremap <silent> <leader>2 :vertical resize -2<cr>
nnoremap <silent> <leader>3 :resize +2<cr>
nnoremap <silent> <leader>4 :resize -2<cr>
nnoremap <silent> <leader>5 :wincmd =<cr>

    " Move between open buffers
    nnoremap <C-l> :bn<CR>
    nnoremap <C-h> :bp<CR>


    nnoremap <C-j> gj
    nnoremap <C-k> gk

    " === Misc ===

    inoremap tn <Esc>
    nnoremap <leader>t :NERDTreeToggle<cr>
    nnoremap <leader>o :e.<cr>

    " yank, delete, paste
    "nnoremap <leader>y "+y
    "nnoremap <leader>Y "+Y
    "nnoremap <leader>d "+d
    "nnoremap <leader>D "+D
    "nnoremap <leader>p "+p
    "nnoremap <leader>P "+P


    " search and replace
    nnoremap <leader>r :%s```cg<Left><Left><Left><Left>

    " Toggle search highlight
    nnoremap <leader>h :set hlsearch! hlsearch?<CR>

    " Close current buffer
    nnoremap <leader>b :bd<CR>

    " Show open buffers
    nnoremap <F4> :buffers<CR>:

    " Reload current buffer
    nnoremap <F5> :e<cr>


    " Make zO recursively open whatever fold we're in, even if it's partially open.
    nnoremap zO zczO

    " Indent/outdent current block...
    nmap %% $>i}``
    nmap $$ $<i}``

    " Visual Block mode is far more useful that Visual mode (so swap the commands).
    nnoremap v <C-v>
    nnoremap <C-v> v

    " Make BS/DEL work as expected in visual modes (i.e. delete the selected text).
    vmap <BS> x

    " Select the entire file...
    nnoremap vaa VGo1G

    " Run make
    nnoremap <F6>  :make!<cr><cr><cr>:cw<cr><cr>
    nnoremap <F7>  :cp<cr>
    nnoremap <F8>  :cn<cr>
    nnoremap <F9>  :call g:QFixToggle()<cr>

    function! g:QFixToggle()
          if exists("g:qfix_win")
            cclose
            unlet g:qfix_win
          else
            copen 10
            let g:qfix_win = bufnr("$")
          endif
    endfunction

    " Toggle line numbers
    nnoremap <leader>n :call g:ToggleNuMode()<CR>
    nnoremap <leader>nn :call g:ToggleNoNuMode()<cr>

    function! g:ToggleNoNuMode()
        if(&number == 1)
            set nonumber
            set norelativenumber
        else
            set number
            set relativenumber
        endif
    endfunc

    function! g:ToggleNuMode()
        if(&relativenumber == 1)
            set number
            set norelativenumber
        else
            set number
            set relativenumber
        endif
    endfunc

    " Remove trailing whitespace...
    nnoremap <leader>x mz:silent! call TrimTrailingWS()<CR>'z

    function! TrimTrailingWS()
        if search('\s\+$', 'cnw')
            :%s/\s\+$//ge
        endif
    endfunction

    " Sort lines
    vnoremap <leader>s :!sort<cr>

    " Wrap
    nnoremap <leader>W :set wrap!<cr>

    " Inserting blank lines
    nnoremap <space> o<Esc><UP>
    nnoremap <cr> O<ESC><DOWN>

    " Reselect last-pasted text
    nnoremap gp `[v`]

    " I constantly hit "u" in visual mode when I mean to "y". Use "gu" for those rare occasions.
    " From https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
    vnoremap u <nop>
    vnoremap gu u

    " "Uppercase word" mapping.

    "
    " This mapping allows you to press <c-u> in insert mode to convert the current
    " word to uppercase.  It's handy when you're writing names of constants and
    " don't want to use Capslock.
    "
    " To use it you type the name of the constant in lowercase.  While your
    " cursor is at the end of the word, press <c-u> to uppercase it, and then
    " continue happily on your way:
    "
    "                            cursor
    "                            v
    "     max_connections_allowed|
    "     <c-u>
    "     MAX_CONNECTIONS_ALLOWED|
    "                            ^
    "                            cursor
    "
    " It works by exiting out of insert mode, recording the current cursor location
    " in the z mark, using gUiw to uppercase inside the current word, moving back to
    " the z mark, and entering insert mode again.
    "
    " Note that this will overwrite the contents of the z mark.  I never use it, but
    " if you do you'll probably want to use another mark.
    inoremap <C-u> <esc>mzgUiw`za

    " Panic Button
    nnoremap <F12> mzggg?G`z

    " Keep the cursor_in place while joining lines
    nnoremap J mzJ`z

    " Split line (sister to [J]oin lines)
    " The normal use of S is covered by cc, so don't worry about shadowing it.
    nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

    " Sudo to write
    cnoremap w!! w !sudo tee % >/dev/null

    " Toggle [i]nvisible characters
    nnoremap <leader>i :set list!<cr>

    " Unfuck my screen
    nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

    " Zip Right
    "
    " Moves the character under the cursor to the end of the line.  Handy when you
    " have something like:
    "
    "     foo
    "
    " And you want to wrap it in a method call, so you type:
    "
    "     println()foo
    "
    " Once you hit escape your cursor is on the closing paren, so you can 'zip' it
    " over to the right with this mapping.
    "
    " This should preserve your last yank/delete as well.
    nnoremap zl x$p

    " Close all netrw buffers
    function! s:close_explorer_buffers()
        for i in range(1, bufnr('$'))
            if getbufvar(i, '&filetype') == "netrw"
                silent exe 'bdelete! ' . i
            endif
        endfor
    endfunction

    nnoremap <C-e><C-x> :call <sid>close_explorer_buffers()<cr>


" END ---------------------------------------------------------------------- }}}

" Folding ------------------------------------------------------------------ {{{

set foldmethod=marker
set foldlevelstart=0
set foldnestmax=2

"Toggle fold methods \fo
let g:FoldMethod = 0
map <leader>z :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe 'set foldmethod=indent'
        let g:FoldMethod = 1
    else
        exe 'set foldmethod=marker'
        let g:FoldMethod = 0
    endif
endfun

" Save folds when you leave buffer
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" END ---------------------------------------------------------------------- }}}

" Filetype-specific ------------------------------------------------------- {{{

" Assembly {{{

augroup ft_asm
    au!
    au FileType asm setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8
augroup END

" }}}

" C {{{

augroup ft_c
    au!
    au FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}

" CSS and LessCSS {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}

" Java {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
augroup END

" }}}
" Javascript {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}
    au FileType javascript call MakeSpacelessBufferIabbrev('clog', 'console.log();<left><left>')

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
    " }

    " Prettify a hunk of JSON with <localleader>p
    au FileType javascript nnoremap <buffer> <localleader>p ^vg_:!python -m json.tool<cr>
    au FileType javascript vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

" }}}

" json {{{

au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" Makefile {{{

augroup ft_make
    au!

    au Filetype make setlocal shiftwidth=8
augroup END

" }}}
" Markdown {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1

    " Use <localleader>1/2/3 to add headings.

    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 mzI###<space><esc>`zllll
    au Filetype markdown nnoremap <buffer> <localleader>4 mzI####<space><esc>`zlllll

    au Filetype markdown nnoremap <buffer> <localleader>p VV:'<,'>!python -m json.tool<cr>
    au Filetype markdown vnoremap <buffer> <localleader>p :!python -m json.tool<cr>
augroup END

" }}}

" Standard In {{{

"augroup ft_stdin
"    au!

    " Treat buffers from stdin (e.g.: echo foo | vim -) as scratch.

" }}}

" Vim {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

" }}}


" END ---------------------------------------------------------------------- }}}

" Reload Herbstluwftwm when file in herbstluftwm dir is saved
    autocmd BufWritePost */herbstluftwm/* silent !herbstclient reload
" Restart sxhkd when sxhkdmrc is saved.
    autocmd BufWritePost */sxhkdrc silent !killall sxhkd; setsid sxhkd &


"so $workman
so $mycolorfile
"color perskjans
