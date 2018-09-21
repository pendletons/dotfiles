" Auto-format on save
au BufWrite * :Autoformat
autocmd BufNewFile,BufRead Gemfile set filetype=ruby

autocmd FileType eruby,yaml,sh,gitcommit let b:autoformat_autoindent=0
