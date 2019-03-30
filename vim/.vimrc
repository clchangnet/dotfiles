set autoindent
filetype plugin indent on
syntax on
colorscheme Tomorrow-Night
set background=dark
set t_Co=256
set number
let mapleader = ","
set laststatus=2
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
set complete=.,w,b,u
set noerrorbells visualbell t_vb=
set directory=$HOME/.vim/swapfiles//
"set rtp+=/usr/local/opt/fzf

"fzf-filemru key bindings
nnoremap <leader>p :FilesMru --tiebreak=index<cr>
map <C-p> :FilesMru --tiebreak=index<CR>

map <leader>s :source ~/.vimrc<CR>
map <leader>ev :e ~/.vimrc<CR>

"remove trailing spaces when save
autocmd BufWritePre * :%s/\s\+$//e

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

nmap <leader>e :MRU<CR>
nmap <leader>w :bd<CR>
nmap ;w :w<CR>

nnoremap <silent><leader>f :call PhpCsFixerFixFile()<CR>

nnoremap <Leader>q :Bdelete<CR>

let $FZF_DEFAULT_COMMAND = 'ag --skip-vcs-ignores -g ""'

let g:fzf_filemru_bufwrite = 1
let g:fzf_filemru_git_ls = 1
let g:fzf_filemru_ignore_submodule = 1

imap jj <Esc>

"Syntastic recommended default settings.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_checkers = ['php', 'phpmd']

" import use
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" function! IPhpExpandClass()
"     call PhpExpandClass()
"     call feedkeys('a', 'n')
" endfunction
" autocmd FileType php inoremap <Leader>q <Esc>:call IPhpExpandClass()<CR>
" autocmd FileType php noremap <Leader>q :call PhpExpandClass()<CR>

let g:php_namespace_sort_after_insert = 1
let g:php_namespace_sort = "'{,'}-1!awk '{print length, $0}' | sort -n -s | cut -d' ' -f2-"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'man', 'rogue']

"let g:netrw_sort_sequence = '[\/]$,*'

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

"let g:php_cs_fixer_rules = "@PSR2"

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-vinegar'
Plug 'StanAngeloff/php.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'yegappan/mru'
Plug 'vim-syntastic/syntastic'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'moll/vim-bbye'
"Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()
filetype plugin indent on

"-------------Auto-Commands--------------"
"
""Automatically source the Vimrc file on save.

augroup reload_vimrc
	autocmd!
"	:autocmd BufWritePost .vimrc source %
    autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
"autocmd BufWritePost *.php silent!
"!ctags -R --PHP-kinds=cfi --regex-php="/^[ \t]*trait[\t]+([a-z2_9_]+)/\1/t,traits/i" --exclude=node_modules --exclude=vendor
