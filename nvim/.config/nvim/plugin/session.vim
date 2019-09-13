scriptencoding utf-8

" ==============================================================================
" === Session
" ==============================================================================

if exists('g:loaded_session')
    finish
endif

if !exists('g:session_dir')
    let g:session_dir = $HOME.'/.vim/sessions/'
endif

function! s:SaveSession()
    let b:session_dir = g:session_dir . getcwd()
    if !isdirectory(b:session_dir)
        call mkdir(b:session_dir, 'p')
    endif

    let s:save_enabled = 1
    let b:filename = b:session_dir . '/session.vim'
    exe "mksession! " . b:filename
endfunc

function! s:LoadSession()
    let b:session_file = g:session_dir . getcwd() . "/session.vim"
    if filereadable(b:session_file)
        let s:save_enabled = 1
        exe 'source ' b:session_file
    else
        echo "No session loaded."
    endif
endfunc

function! s:DeleteSession()
    let b:session_file = g:session_dir . getcwd() . "/session.vim"
    if !filereadable(b:session_file)
        return
    endif

    if confirm("Delete session file?", "&Yes\n&No", 2) == 1
        call delete(fnameescape(b:session_file))
        let s:save_enabled = 0
    endif
endfunc

function! s:AutoSave()
    if exists("s:save_enabled") && s:save_enabled == 1
        call s:SaveSession()
    endif
endfunc

function! s:StartUp()
    " Only autoload a session when no files were given on the commandline
    if argc() == 0
        call s:LoadSession()
    endif
endfunc

" Register the commands
command! -bar -bang -nargs=0 SaveSession call s:SaveSession()
command! -bar -bang -nargs=0 LoadSession call s:LoadSession()
command! -bar -bang -nargs=0 DeleteSession call s:DeleteSession()

augroup PluginSession
    autocmd!
    autocmd VimEnter * nested call s:StartUp()
    autocmd VimLeavePre * call s:AutoSave()
augroup END

let g:loaded_session = 1
