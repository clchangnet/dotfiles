" markdown wrap 80
au BufRead,BufNewFile *.md setlocal textwidth=80
" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" distinct  highlight current, first and last match when searching
function! HLCurrent() abort
	if exists("currmatch")
		call matchdelete(currmatch)
	endif
	" only on cursor
	let patt = '\c\%#'.@/
	" check prev and next match
	let prevmatch = search(@/, 'bWn')
	let nextmatch = search(@/, 'Wn')
	" if on first or last match
	if prevmatch == 0 || nextmatch == 0
		let currmatch = matchadd('EdgeSearch', patt, 101)
	else
		let currmatch = matchadd('IncSearch', patt, 101)
	endif
	redraw
endfunction