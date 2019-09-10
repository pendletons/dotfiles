" Automatically wrap at 72 characters and spell check commit messages
call setpos('.', [0, 1, 1, 0])
autocmd BufNewFile,BufRead PULLREQ_EDITMSG set syntax=gitcommit

call setpos('.', [0, 1, 1, 0])
setlocal textwidth=72
setlocal spell spelllang=en_gb
setlocal colorcolumn=51,73,81

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match     OverLength /\%73v.\+/
