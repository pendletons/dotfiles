" Auto-format on save
au BufWrite * :Autoformat

autocmd FileType eruby,yaml,sh,gitcommit let b:autoformat_autoindent=0
