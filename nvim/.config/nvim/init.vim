scriptencoding utf-8

" ==============================================================================
" === Neovim configuration file - init.vim
" ==============================================================================

" ===== Environment Variables =====
if $XDG_CACHE_HOME ==# ''
  let $XDG_CACHE_HOME = $HOME.'/.cache'
endif

if $XDG_CONFIG_HOME ==# ''
  let $XDG_CONFIG_HOME = $HOME.'/.config'
endif

if $GOPATH ==# ''
  let $GOPATH = $HOME.'/Development/Go'
endif

" ==============================================================================
" === Plugins
" ==============================================================================

" Autoinstall vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plugged
    autocmd! VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.config/nvim/plugged')

" ===== Display/Interface =====
" Colorschemes
Plug 'bluz71/vim-moonfly-colors'
Plug 'lifepillar/vim-solarized8'
Plug 'lifepillar/vim-gruvbox8'
  let g:gruvbox_italic = 1

Plug 'majutsushi/tagbar'

Plug 'mbbill/undotree'

" ===== Files =====
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : './install --all' }

Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'window' : 'enew' }

Plug 'scrooloose/nerdtree'
  let g:NERDTreeAutoDeleteBuffer = 1
  let g:NERDTreeMinimalUI = 1

Plug 'Xuyuanp/nerdtree-git-plugin'

" ===== Autocomplete/Snippets =====
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif

Plug 'zchee/deoplete-clang'
  let g:deoplete#sources#clang#libclang_path = '/usr/local/llvm50/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/local/llvm50/lib/clang/'

Plug 'zchee/deoplete-go', { 'do' : 'make' }
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#use_cache = 1
  let g:deoplete#sources#go#json_directory = $XDG_CACHE_HOME.'/deoplete/go/linux_amd64'

Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

Plug 'SirVer/ultisnips'
  let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
  let g:UltiSnipsEditSplit = 'context'
  let g:UltiSnipsExpandTrigger = '<C-b>'
  let g:UltiSnipsJumpForwardTrigger = '<C-j>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

Plug 'honza/vim-snippets'

" ===== Git =====
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

" ===== Languages/Syntax =====
Plug 'w0rp/ale'
  let g:airline#extensions#ale#enabled = 1

" Golang
Plug 'fatih/vim-go'
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_types = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1

" C/C++
Plug 'justinmk/vim-syntax-extra'

" Ruby/Rails
Plug 'tpope/vim-rails'

" LaTeX
Plug 'lervag/vimtex'

" ===== Miscellaneous =====
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = $XDG_CACHE_HOME.'/nvim/tags'
  let g:gutentags_ctags_exclude = ['go']

Plug 'tmhedberg/matchit'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" ==============================================================================
" === Settings
" ==============================================================================

" Files/Buffers
set autoread        " reload files changed outside of vim
set hidden          " hide buffers instead of closing them
set nobackup        " don't create backup files
set noswapfile      " don't create swap files
set undofile        " keep persistent undo history

" Cursor/Line
set number          " show line numbers
set relativenumber  " show relative line numbers
set cursorline      " highlight the current line
set showmatch       " highlight matching brackets
set scrolloff=999   " keep cursor centered vertically
set nowrap          " don't wrap lines

" Tabs/Indentation
set expandtab       " use spaces as tabs by default
set tabstop=8       " tabs get the default length of 8 spaces
set softtabstop=-1  " negative just uses the value of shiftwidth
set shiftwidth=4
set shiftround
set copyindent      " copy indentation for new lines
set smarttab

" Search
set ignorecase      " ignore case when searching
set smartcase       " ignore case only when all lowercase
set hlsearch        " highlight search terms
set incsearch       " show search matches as you type

" Windows
set splitbelow      " new splits appear below current window
set splitright      " new vertical splits appear to the right
set updatetime=100  " milliseconds for the cursorhold event

" Statusline
set noshowmode      " don't print current mode
set laststatus=2    " always display statusline
set showtabline=2   " always display tabline

" Hidden characters
set list
set listchars=tab:•·,trail:·,extends:❯,precedes:❮,nbsp:×

set lazyredraw      " only redraw the UI when needed
set completeopt=menu,noselect

" Colorscheme
set background=dark
syntax enable
colorscheme gruvbox8

" Enable true-color support if available
if has('termguicolors')
  set termguicolors
endif

" Cursor style
set guicursor=n-v:block,i-c-ci-ve:ver25,r-cr:hor20,o:hor50
              \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175

" Set Search tool if available
if executable('rg') " ripgrep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m
elseif executable('pt') " the platinum searcher
  set grepprg=pt\ --nogroup\ --nocolor\ --ignore-case
elseif executable('ag') " the silver searcher
  set grepprg=ag\ --nogroup\ --nocolor
endif

" cscope
if has('cscope')
  set cscopetag         " Use cscope for tag lookups
  set cscopetagorder=0  " Search cscope db before tags file
  set cscopequickfix=s-,c-,d-,i-,t-,e-,a- " Output find results to quickfix
  if filereadable("cscope.out") " Add any database found in current directory
    cscope add cscope.out
  elseif $CSCOPE_DB != "" " else add database pointed to by environment
    cscope add $CSCOPE_DB
  endif
endif

" ===== Variables =====
" Set Leader Keys
let g:mapleader = ' '
let g:maplocalleader = ','

" Vimtex autocompletion
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" ==============================================================================
" === Autocommands
" ==============================================================================

if has('autocmd')

  " Terminal specific autocommands
  augroup term
    autocmd! BufWinEnter,WinEnter term://* startinsert
  augroup END

  " Enable spelling and line breaks for text files
  augroup prose
    autocmd!
    autocmd FileType gitcommit,text,tex,plaintex,markdown setlocal spell
    autocmd FileType tex,plaintex,markdown setlocal textwidth=80
  augroup END

  " Easy quit windows
  augroup quit_windows
    autocmd!
    autocmd FileType qf,help,diff nnoremap <buffer><silent> q :q<CR>
  augroup END

  " Filetype overrides
  augroup filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.h setlocal filetype=c
  augroup END

endif

" ==============================================================================
" === Keybindings
" ==============================================================================

" Make Y consistent with C and D
nnoremap Y y$

" Shortcut to edit init.vim
nnoremap <leader>v :tabedit $MYVIMRC<CR>

" Easier resize windows
nnoremap <silent> <leader>+ :resize +5<CR>
nnoremap <silent> <leader>- :resize -5<CR>
nnoremap <silent> <leader>> :vertical resize +5<CR>
nnoremap <silent> <leader>< :vertical resize -5<CR>

" Quick escape shortcuts for terminal mode
tnoremap <C-[> <C-\><C-n>
tnoremap <ESC> <C-\><C-n>

" Window navigations shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Completion menu bindings
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

" QuickFix menu bindings
nnoremap <silent> <leader>q :copen<CR>
nnoremap <silent> <leader>l :lopen<CR>

" Clear search
nnoremap <silent> <leader>/ :let @/=''<CR>

" Ultisnips bindings
nnoremap <silent> <leader>se :UltiSnipsEdit<CR>

" Tagbar bindings
nnoremap <silent> <leader>t :TagbarToggle<CR>

" NERDTree bindings
nnoremap <silent> <leader>f :NERDTreeToggle<CR>
nnoremap <silent> <leader>F :NERDTreeFind<CR>

" UndoTree bindings
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" FZF bindings
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>oo :Files $HOME<CR>
nnoremap <silent> <leader>ob :Buffers<CR>
nnoremap <silent> <leader>ow :Windows<CR>
nnoremap <silent> <leader>ot :Tags<CR>
nnoremap <silent> <leader>og :GFiles<CR>
nnoremap <silent> <leader>oc :Commits<CR>
nnoremap <silent> <leader>os :Snippets<CR>

" Git bindings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gE :Gedit<space>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gR :Gread<space>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gW :Gwrite!<CR>
nnoremap <silent> <leader>gq :Gwq<CR>
nnoremap <silent> <leader>gQ :Gwq!<CR>
nnoremap <silent> <leader>gt :GitGutterAll<CR>
