setlocal ai sw=2 sts=2 et
setlocal path+=lib
setlocal iskeyword+=? " Make ? part of words

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Berksfile set filetype=ruby
