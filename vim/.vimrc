set autoindent
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night
set background=dark
set t_Co=256
set number
let mapleader = ","
"set laststatus=2
set hidden
set nowrap
set nobackup
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
"set backspace=2
"set encoding=utf-8
"set wildmenu
set ignorecase
set splitbelow
set splitright
set autoread
"set timeout ttimeout timeoutlen=200
set scrolloff=5
"set autowriteall
set hlsearch
set showmatch
set noerrorbells visualbell t_vb=
"set rtp+=/usr/local/opt/fzf

"fzf-filemru key bindings
nnoremap <leader>p :FilesMru --tiebreak=index<cr>
map <C-p> :FilesMru --tiebreak=index<CR>

map <leader>s :source ~/.vimrc<CR>
map <leader>ev :e ~/.vimrc<CR>

nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>

imap jj <Esc>

let g:lightline = {
\ 'colorscheme': 'seoul256',
\ }

"cursor insert normal mode
if exists('$TMUX')
  let &t_SI = "\<esc>Ptmux;\e\e[5 q\e\\"  " blinking I-beam in insert mode
  let &t_SR = "\<esc>Ptmux;\e\e[3 q\e\\"  " blinking underline in replace mode
  let &t_EI = "\<esc>Ptmux;\e\e[1 q\e\\"  " default cursor (usually blinking block) otherwise
else
  let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
  let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
  let &t_EI = "\<esc>[1 q"  " default cursor (usually blinking block) otherwise
endif

let g:php_cs_fixer_rules = "@PSR2"

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
call plug#end()

"-------------Auto-Commands--------------"
"
""Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	:autocmd BufWritePost .vimrc source %
augroup END

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
