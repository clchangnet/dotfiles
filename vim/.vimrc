set nocompatible
set autoindent
filetype plugin indent on
syntax on
" colorscheme Tomorrow-Night
colorscheme cosmic_latte
" set guifont=MesloLGLDZ\ Nerd\ Font\ 10
set guifont=FuraCode\ Nerd\ Font\ 10
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=L
set guioptions-=R
set guioptions-=m  "remove menu bar
" set go-=L " Removes left hand scroll bar
set background=dark
set linespace=8
"set t_Co=256
set termguicolors
"set number relativenumber
set number
let mapleader = ","
set laststatus=2
set hidden
set wrap
set nobackup
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
"set backspace=2
set encoding=utf-8
"set wildmenu
set ignorecase
set splitbelow
set splitright
set autoread
"set timeout ttimeout timeoutlen=200
set scrolloff=5
"auto write when switching buffer
"set autowriteall
set hlsearch
set showmatch
set complete=.,w,b,u
set belloff=all
set rtp+=~/.fzf/bin/fzf,/usr/bin/fzf
" set noerrorbells
" set visualbell
" set t_vb=
set t_RV=
set foldcolumn=2
highlight VertSplit guifg=bg guibg=bg
hi NonText guifg=bg
set directory=$HOME/.vim/swapfiles//

"""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"fzf-filemru key bindings
nnoremap <leader>p :FilesMru --tiebreak=index<cr>
map <C-p> :FilesMru --tiebreak=index<CR>

map <leader>s :source ~/.vimrc<CR>
map <leader>ev :e ~/.vimrc<CR>

"remove trailing spaces when save
autocmd BufWritePre * :%s/\s\+$//e

"change for using Esc may be causing arrow key problems
nnoremap <silent> ,, :nohlsearch<Bar>:echo<CR>

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

nmap <leader>e :MRU<CR>
" nmap <leader>w :bd<CR>
"nmap ;w :w<CR>
nmap <leader>w :w<CR>

nnoremap <Leader>q :Bdelete<CR>

" netrw
nnoremap <Leader>m :Lexplore<CR>
" nnoremap - :exe 'Lexplore' expand('%:h')<CR>
let g:netrw_winsize=25
let g:netrw_liststyle=3

"nerd tree
let NERDTreeHijackNetrw = 0
" nmap <d-1> :NERDTreeToggle<cr>
nmap <F2> :NERDTreeToggle<CR>

" let $FZF_DEFAULT_COMMAND = 'ag --skip-vcs-ignores -g ""'

let g:fzf_filemru_bufwrite = 1
let g:fzf_filemru_git_ls = 1
let g:fzf_filemru_ignore_submodule = 1

" imap jj <Esc>

" formatting html
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" disable indent for json
autocmd Filetype json let g:indentLine_enabled = 0

"Syntastic recommended default settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ycm_autoclose_preview_window_after_completion = 1

" settings for vim snippets
let g:snips_author = "Allan Chang"
let g:snips_email = "allan@clchang.net"
let g:snips_github = "https://github.com/clchangnet"

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

" wrap format
set linebreak showbreak=↪\  breakindent breakindentopt=shift:-2
set formatoptions+=nj

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'yegappan/mru'
" Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'moll/vim-bbye'
Plug 'craigemery/vim-autotag'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
call plug#end()

"-------------Auto-Commands--------------"
"
""Automatically source the Vimrc file on save.

augroup reload_vimrc
	autocmd!
"	:autocmd BufWritePost .vimrc source %
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

" autocmd VimEnter * redraw!
" syntastic with py files writing garbage to screen
set ttyfast
au FileWritePost * :redraw!
au TermResponse * :redraw!
au TextChanged * :redraw!
au QuickFixCmdPre * :redraw!
au QuickFixCmdPost * :redraw!
