let mapleader = ","
map <leader>s :source ~/.config/nvim/init.vim<CR>
map <leader>ev :e ~/dotfiles/nvim/init_regular.vim<CR>

" splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" clear highlight
nnoremap <esc><esc> :silent! nohls<cr>

" quickly toggle term
nnoremap <silent> <leader><space> :vertical botright Ttoggle<cr><C-w>l

" search and center
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz
:nnoremap # #zz
:nnoremap g* g*zz
:nnoremap g# g#zz

" clipboard
vnoremap  <leader>y  "+y
nnoremap <leader>p "+p

" functions HLCurrent
nnoremap <silent> n n:call HLCurrent()<cr>
nnoremap <silent> N N:call HLCurrent()<cr>

" coc-explorer
nmap <space>n :CocCommand explorer --position right<CR>