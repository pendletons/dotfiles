setlocal shiftwidth=2
setlocal tabstop=2

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \ 'ruby': ['rubocop']
      \ }
let g:ale_fixers = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'jsx': ['eslint', 'prettier'],
      \ 'javascript.jsx': ['eslint', 'prettier'],
      \ }
