scriptencoding utf-8

" Vim Custom Statusline

set statusline=
set statusline+=\ [%n]
set statusline+=\ %<%f%m
set statusline+=\ %h%w%q
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=[%{&fileformat}]
set statusline+=\ %4(%p%%%)
set statusline+=\ %9(%l/%L%)
set statusline+=\ :\ %4(%c%)
set statusline+=\ 
