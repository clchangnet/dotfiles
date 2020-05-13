syntax on
colorscheme cosmic_latte

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

" for HLCurrent function
highlight EdgeSearch guibg=green ctermbg=black