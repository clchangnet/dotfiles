" let mapleader = " "
let mapleader = "\<Space>"
map <leader>s :source ~/.config/nvim/init.vim<CR>
map <leader>ev :e ~/dotfiles/nvim/init_regular.vim<CR>

" splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" TAB in general mode will move to text buffer
" nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
" nnoremap <S-TAB> :bprevious<CR>

nnoremap <C-k> :bprev<CR>
nnoremap <C-j> :bnext<CR>

" clear highlight
nnoremap <esc><esc> :silent! nohls<cr>

" quickly toggle term
nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l
:tnoremap <Esc> <C-\><C-n>

" search and center
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

" clipboard
" vnoremap  <leader>y  "+y
" nnoremap <leader>p  "+p

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" save file
nnoremap <Leader>w :w<CR>

" functions HLCurrent
nnoremap <silent> n n:call HLCurrent()<cr>
nnoremap <silent> N N:call HLCurrent()<cr>

" coc-explorer
" nmap <space>n :CocCommand explorer --position right<CR>

" netrw mappings in all.vim
