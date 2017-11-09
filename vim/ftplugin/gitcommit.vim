" Automatically wrap at 72 characters and spell check commit messages
autocmd BufNewFile,BufRead PULLREQ_EDITMSG set syntax=gitcommit
setlocal textwidth=72
setlocal spell spelllang=en_gb
setlocal colorcolumn=51,73,81

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match     OverLength /\%73v.\+/
