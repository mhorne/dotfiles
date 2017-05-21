" ==============================================================
" 	Plugins
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
Plug 'altercation/vim-colors-solarized'
	let g:solarized_contrast = 'high'

Plug 'vim-airline/vim-airline'
	if !exists("g:airlinesymbols")
		let g:airlinesymbols = {}
	endif

	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t'
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'solarized'

Plug 'vim-airline/vim-airline-themes'

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
	let g:fzf_nvim_statusline = 0
	nnoremap <silent> <leader><space> :Files<CR>
	nnoremap <silent> <leader>oo :Files $HOME<CR>
	nnoremap <silent> <leader>ob :Buffers<CR>
	nnoremap <silent> <leader>ow :Windows<CR>
	nnoremap <silent> <leader>ot :Tags<CR>
	nnoremap <silent> <leader>og :GFiles<CR>
	nnoremap <silent> <leader>oc :Commits<CR>

	" Customize fzf colors to match your color scheme
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
	nnoremap <leader>se :UltiSnipsEdit<CR>

	let g:UltiSnipsSnippetsDir = '~/.config/nvim/UltiSnips'
	let g:UltiSnipsEditSplit = 'horizontal'
	let g:UltiSnipsExpandTrigger = "<C-b>"
	let g:UltiSnipsJumpForwardTrigger = "<C-b>"
	let g:UltiSnipsJumpBackwardTrigger = "<C-z>"

Plug 'honza/vim-snippets'

" ===== Git =====
Plug 'tpope/vim-fugitive'
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

Plug 'airblade/vim-gitgutter'
	let g:gitgutter_realtime = 1
	let g:gitgutter_eager = 1
	nnoremap <silent> <leader>gt :GitGutterAll<CR>

" ===== Syntax =====
Plug 'neomake/neomake'
	autocmd! BufWritePost,BufEnter * Neomake

" ===== Languages =====
" Golang
Plug 'fatih/vim-go'
	let g:go_highlight_functions = 1
	let g:go_highlight_methods = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_types = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_build_constraints = 1

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

Plug 'ervandew/supertab'
	let g:SuperTabDefaultCompletionType = "<C-n>"
	let g:SuperTabContextDefaultCompletionType = "<C-n>"

call plug#end()

" ===============================================================
" 	General Settings
" ===============================================================

set number		" show line numbers
set relativenumber	" show relative line numbers
set hidden		" hide buffers instead of closing them
set nobackup		" don't create backup files

set nowrap		" don't wrap lines
set shiftround
set copyindent
set showmatch		" highlight matching brackets
set smarttab
set noshowmode

set ignorecase	" ignore case when searching
set smartcase	" ignore case only when all lowercase
set hlsearch	" highlight search terms
set incsearch	" show search matches as you type

set splitbelow
set splitright

set virtualedit=onemore " allow cursor one character after line
set clipboard=unnamed,unnamedplus

set list " show hidden characters
set listchars=tab:•·,trail:·,extends:❯,precedes:❮,nbsp:×

set background=dark
colorscheme solarized

set cursorline		" highlight the current line
set scrolloff=999	" keep cursor centered vertically
set lazyredraw		" only redraw the UI when needed

set regexpengine=1 " use old regexp engine

" Cursor settings
let &t_SI = "\<Esc>[5 q" " blinking bar in insert mode
let &t_SR = "\<Esc>[3 q" " blinking underscore in replace mode
let &t_EI = "\<Esc>[2 q" " regular block in normal mode

" ===== Autocommands =====
" Start insert mode when entering a terminal buffer
autocmd BufWinEnter,WinEnter term://* startinsert

" ===== Keybindings =====
nnoremap ; :

" Quick save file
nnoremap <leader>w :w<CR>

" Shortcut to open init.vim
" nnoremap <leader>vi :tabedit $MYVIMRC<CR>

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

