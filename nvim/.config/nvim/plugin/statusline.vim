scriptencoding utf-8

" ==============================================================================
" === Statusline
" ==============================================================================

if exists('g:loaded_statusline')
    finish
endif
let g:loaded_statusline = 1

" Enable statusline and tabline
set laststatus=2
set showtabline=2

" Main statusline layout
set statusline=
set statusline+=\ [%n]              " Buffer number
set statusline+=\ %<%f%m            " File path
set statusline+=\ %h%w%q            " Special window types
set statusline+=%=
set statusline+=\ %y                " File type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} " File encoding
set statusline+=[%{&fileformat}]    " File format
set statusline+=\ %4(%p%%%)         " Percentage in file
set statusline+=\ %9(%l/%L%)        " Row number
set statusline+=\ :\ %3(%v%)        " Virtual column number
set statusline+=\ 
