" ==============================================================
" === Plugins
" ==============================================================

" Autoinstall vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:mapleader = "\<Space>" " set <leader>

call plug#begin('~/.config/nvim/plugged')

" ===== Display/Interface =====

" Colorschemes
Plug 'bluz71/vim-moonfly-colors'
Plug 'tomasr/molokai'
Plug 'lifepillar/vim-solarized8'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
  let g:gruvbox_italic = 1

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline_powerline_fonts = 1
  let g:airline_theme = 'gruvbox'

Plug 'majutsushi/tagbar'
  let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
    \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
    \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
  \ }

" ===== Files =====
Plug 'junegunn/fzf', { 'dir' : '~/.fzf', 'do' : './install --all' }

Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'window' : 'enew' }
  let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

Plug 'scrooloose/nerdtree'
  let g:NERDTreeQuitOnOpen = 1
  let g:NERDTreeAutoDeleteBuffer = 1
  let g:NERDTreeMinimalUI = 1

Plug 'Xuyuanp/nerdtree-git-plugin'

" ===== Autocomplete/Snippets =====
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1

Plug 'zchee/deoplete-clang'
  let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
  let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

Plug 'zchee/deoplete-go', { 'do' : 'make' }
  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#use_cache = 1
  let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go/$GOOS_$GOARCH'

Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'

Plug 'SirVer/ultisnips'
  let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
  let g:UltiSnipsEditSplit = 'context'
  let g:UltiSnipsExpandTrigger = "<C-b>"
  let g:UltiSnipsJumpForwardTrigger = "<C-j>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

Plug 'honza/vim-snippets'

" ===== Git =====
Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'
  let g:gitgutter_realtime = 1
  let g:gitgutter_eager = 1

" ===== Languages/Syntax =====
Plug 'neomake/neomake'
  autocmd! BufWritePost,BufEnter * Neomake

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
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-rails'

" Misc Formats
Plug 'lervag/vimtex'
Plug 'elzr/vim-json'
Plug 'cespare/vim-toml'

" ===== Miscellaneous =====
Plug 'tmhedberg/matchit'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

Plug 'Shougo/echodoc.vim'

call plug#end()

" ===============================================================
" === General Settings
" ===============================================================

set autoread        " reload files changed outside of vim
set hidden          " hide buffers instead of closing them
set nobackup        " don't create backup files
set noswapfile      " don't create swap files
set noshowmode      " don't print current mode

set number          " show line numbers
set relativenumber  " show relative line numbers
set nowrap          " don't wrap lines

set expandtab       " use spaces as tabs by default
set tabstop=2       " number of spaces a tab counts for
set softtabstop=2
set shiftround
set copyindent      " copy indentation for new lines
set showmatch       " highlight matching brackets
set smarttab

set ignorecase  " ignore case when searching
set smartcase   " ignore case only when all lowercase
set hlsearch    " highlight search terms
set incsearch   " show search matches as you type

set splitbelow
set splitright

set virtualedit=onemore  " allow cursor one character after line
set clipboard=unnamed,unnamedplus

set list  " show hidden characters
set listchars=tab:•·,trail:·,extends:❯,precedes:❮,nbsp:×

set background=dark
set termguicolors   " enable 24-bit truecolors
colorscheme gruvbox

set cursorline     " highlight the current line
set scrolloff=999  " keep cursor centered vertically
set lazyredraw     " only redraw the UI when needed
set laststatus=2   " always draw statusline

" Cursor settings
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
              \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175

" ===== Autocommands =====
" Start insert mode when entering a terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert
" ===============================================================
" === Keybindings
" ===============================================================

" Easier command key
nnoremap ; :

" Quick save file
nnoremap <leader>w :w<CR>

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

inoremap <C-h> <C-[><C-w>h
inoremap <C-j> <C-[><C-w>j
inoremap <C-k> <C-[><C-w>k
inoremap <C-l> <C-[><C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Deoplete completion menu bindings
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

" Ultisnips bindings
nnoremap <silent> <leader>se :UltiSnipsEdit<CR>

" NERDTree bindings
nnoremap <silent> <leader>f :NERDTreeToggle<CR>
nnoremap <silent> <leader>F :NERDTreeFind<CR>

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
