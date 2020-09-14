
" Trim trailing whitespace
    function! perskjans#trim_trailing_whitespace()
        if search('\s\+$', 'cnw')
            :%s/\s\+$//ge
        endif
    endfunction


" Toggle foldmethod
    function! perskjans#toggle_fold()
        if g:FoldMethod == 0
            exe 'set foldmethod=indent'
            let g:FoldMethod = 1
        else
            exe 'set foldmethod=marker'
            let g:FoldMethod = 0
        endif
    endfunction


" Cycle through relativenumber + number, number (only), and no numbering.
    function! perskjans#cycle_numbering() abort
        if exists('+relativenumber')
            execute {
                \ '00': 'set relativenumber   | set number',
                \ '01': 'set norelativenumber | set number',
                \ '10': 'set norelativenumber | set nonumber',
                \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
        else
            " No relative numbering, just toggle numbers on and off.
            set number!
        endif
    endfunction


" Toggle quickfix window
    function! perskjans#toggle_quicktfix_window()
        if exists("g:qfix_win")
            cclose
            unlet g:qfix_win
        else
            copen 10
            let g:qfix_win = bufnr("$")
        endif
    endfunction
