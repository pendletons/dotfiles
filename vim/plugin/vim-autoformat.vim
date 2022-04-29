" Auto-format on save
if !exists('g:vscode')
  au BufWrite * :Autoformat
  autocmd BufNewFile,BufRead Gemfile set filetype=eruby
  autocmd BufNewFile,BufRead emacs set filetype=lisp

  autocmd FileType yaml,sh,gitcommit let b:autoformat_autoindent=0
endif
