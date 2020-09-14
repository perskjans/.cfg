set foldmethod=indent
set foldlevelstart=99
set foldnestmax=2

let g:FoldMethod = 0

" Save folds when you leave buffer
    augroup folding
        autocmd!
        autocmd BufWinLeave *.* silent mkview
        autocmd BufWinEnter *.* silent loadview
    augroup end



