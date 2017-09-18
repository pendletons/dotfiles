" Automatically wrap at 72 characters and spell check commit messages
setlocal textwidth=72
setlocal spell

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match     OverLength /\%73v.\+/
