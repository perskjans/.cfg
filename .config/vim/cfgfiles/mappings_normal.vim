" Next/previous match for t/f
    nnoremap \ ,
    nnoremap å ,
    nnoremap ö ;

" Disable arrowkeys in normal mode
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> <nop>
    nnoremap <right> <nop>

" Move between open buffers
    nnoremap <A-h> :bp<CR>
    nnoremap <A-l> :bn<CR>
    nnoremap <A-o> :bn<CR>

" Movement
    nnoremap ä <C-u> " Half page up
    nnoremap Ä <C-b> " Full page up
    nnoremap ç <C-d> " Half page down
    nnoremap Ç <C-f> " Full page down

    nnoremap <A-e> gkzz
    nnoremap <A-n> gjzz
    nnoremap k gk
    nnoremap j gj
    nnoremap œ 5gk
    nnoremap ï 5gj
    nnoremap é {zz
    nnoremap ñ }zz

    nnoremap ó l

    nnoremap <C-n> <C-y>    " Scroll down
    nnoremap <C-y> <C-n>    " Line down

" Split windows
    nnoremap © <C-w>v " split vertical
    nnoremap ¢ <C-w>s " split horizontal

" Resize window
    nnoremap <silent> ¹ :vertical resize +2<cr>
    nnoremap <silent> ² :vertical resize -2<cr>
    nnoremap <silent> ³ :resize +2<cr>
    nnoremap <silent> ¤ :resize -2<cr>
    nnoremap <silent> € :wincmd =<cr>

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

" Select the entire file...
    nnoremap vaa VGo1G

" Run make
    nnoremap <silent> <F6>  :make!<cr><cr><cr>:cw<cr><cr>

" Quickfix
    nnoremap <silent> <F7>  :cp<cr>
    nnoremap <silent> <F8>  :cn<cr>
    nnoremap <silent> <F9> :call perskjans#toggle_quicktfix_window()<cr>

" Insert blank lines before, after
    nnoremap <cr> O<ESC><DOWN>
    nnoremap <A-cr> o<Esc><UP>


" Reselect last-pasted text
    nnoremap gp `[v`]


" Panic Button
    nnoremap <F12> mzggg?G`z

" Keep the cursor_in place while joining lines
    nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
    " The normal use of S is covered by cc, so don't worry about shadowing it.
    nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w


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


"    " Close all netrw buffers
"    function! s:close_explorer_buffers()
"        for i in range(1, bufnr('$'))
"            if getbufvar(i, '&filetype') == "netrw"
"                silent exe 'bdelete! ' . i
"            endif
"        endfor
"    endfunction
"
"    nnoremap <C-e><C-x> :call <sid>close_explorer_buffers()<cr>

" Folding
    nnoremap á za
    nnoremap µ zm
    nnoremap ® zr
