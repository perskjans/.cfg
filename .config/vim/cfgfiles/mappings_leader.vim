" Default <leader> is \ (backslash)
let mapleader="\<space>"
let maplocalleader=","


" Leader

    " move between splits
    nnoremap <leader>k  <C-W>k
    nnoremap <leader>j  <C-W>j
    nnoremap <leader>h  <C-W>h
    nnoremap <leader>l  <C-W>l

    " Switch to last used buffer in the window
    nnoremap <leader><leader> <C-^>

    " Show help for <cword> under cursor.
    nnoremap <leader>sh :execute "h " . expand("<cword>") . " "<cr>

    nnoremap <leader>o :e .<cr>

    " search and replace
    nnoremap <leader>r :%s```cg<Left><Left><Left><Left>

    " Close current buffer
    nnoremap <leader>b :bd<CR>

    " Unfuck my screen
    nnoremap <leader>u :syntax sync fromstart<cr>:redraw!<cr>

    " yank, delete, paste
    nnoremap <leader>y "+y
    nnoremap <leader>Y "+Y
    nnoremap <leader>d "+d
    nnoremap <leader>D "+D
    nnoremap <leader>p "+p
    nnoremap <leader>P "+P

    " Clear mappings and reload config
    nnoremap <silent> <leader>0 :mapclear<cr>:imapclear<cr>:so $MYVIMRC<cr>

" Localleader
    " Toggle search highlight
    nnoremap <silent> <localleader>h :set hlsearch! hlsearch?<CR>

    " Cycle number mode
    nnoremap <silent> <localleader>n :call perskjans#cycle_numbering()<CR>

    " Sort lines
    vnoremap <localleader>s :!sort<cr>

    " Wrap
    nnoremap <localleader>w :set wrap!<cr> :set wrap?<cr>

    " Toggle [i]nvisible characters
    nnoremap <localleader>i :set list!<cr> :set list?<cr>

    " Remove trailing whitespace...
    nnoremap <silent> <localleader>x mz :call perskjans#trim_trailing_whitespace()<CR>`z
