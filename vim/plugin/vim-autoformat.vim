" Auto-format on save
au BufWrite * :Autoformat

autocmd FileType eruby,gitcommit let b:autoformat_autoindent=0
