" nnoremap <silent> <LocalLeader>e :<C-u>Defx -resume -toggle -direction=botright -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <silent> <LocalLeader>a :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
nnoremap <silent> <LocalLeader>e :Lexplore!<CR>
