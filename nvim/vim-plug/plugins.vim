" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
