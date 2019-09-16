scriptencoding utf-8

if exists('g:loaded_cscope')
    finish
endif
let g:loaded_cscope = 1

" cscope
if has('cscope')

    set csto=0          " Prefer cscope definitions over ctags
    set cscopetag       " Use cscope for tag lookups

    " Output find results to quickfix
    set cscopequickfix=s-,c-,d-,i-,t-,e-,a-

    " Add any database found in current directory or those specified by the
    " environment.
    if filereadable("cscope.out")
        cscope add cscope.out
    elseif $CSCOPE_DB != ""
        cscope add $CSCOPE_DB
    endif

    " Key mappings
    nmap <leader>ca :cs find a <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>cf :cs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>ci :cs find i <C-R>=expand("<afile>")<CR><CR>
    nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>

endif
