nnoremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir=$HOME"/.config/nvim/.undodir"
    set undofile
endif
