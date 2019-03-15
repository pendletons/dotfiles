" Auto-format on save
au BufWrite * :Autoformat
autocmd BufNewFile,BufRead Gemfile set filetype=eruby

autocmd FileType eruby,yaml,sh,gitcommit let b:autoformat_autoindent=0
