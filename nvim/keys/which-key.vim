" which key
let g:maplocalleader = "\<Space>"
let g:mapleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_use_floating_win = 0