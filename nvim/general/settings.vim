set iskeyword+=-
set number
set splitbelow
set splitright
" set t_Co=256
" This is recommended by coc
set nobackup
set nowritebackup
" set clipboard=unnamedplus

set nohlsearch

set scrolloff=8

set noswapfile

set splitright

" set guifont=SauceCodePro\ Nerd\ Font\ 14
" set guifont=GoMono\ Nerd\ Font\ Mono\ Book\ 11

" treesitter settings
set completeopt=menuone,noinsert,noselect
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=10
set nofoldenable
set foldlevel=2

set relativenumber
set nu

" for HLCurrent function
set shortmess+=s

" netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=20
let g:netrw_keepdir=0
" let g:netrw_altv=1

" close buffer keeping split
" command! Bd bp|bd #
