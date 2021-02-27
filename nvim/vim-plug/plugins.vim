" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Neovim Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'mhinz/vim-startify'

Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'junegunn/goyo.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'liuchengxu/vim-which-key'
" Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'kassio/neoterm'
" Plug 'dense-analysis/ale'
Plug 'qpkorr/vim-bufkill'
Plug 'rust-lang/rust.vim'
" Plug 'tmsvg/pear-tree'
Plug 'vim-test/vim-test'
Plug 'mbbill/undotree'
" Plug 'kristijanhusak/defx-icons'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Cheat Sheet
Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
