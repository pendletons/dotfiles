" Line numbers
highlight LineNr ctermbg=none ctermfg=105

" GitGutter
highlight clear SignColumn
highlight GitGutterAdd          ctermfg=40 ctermbg=none guifg=40 guibg=none
highlight GitGutterChange       ctermfg=20 ctermbg=none guifg=20 guibg=none
highlight GitGutterDelete       ctermfg=9  ctermbg=none guifg=9  guibg=none
highlight GitGutterChangeDelete ctermfg=20 ctermbg=none guifg=20 guibg=none

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

highlight CursorLine cterm=none ctermfg=16 ctermbg=8  gui=none guifg=Black guibg=#A0A0A0
highlight Folded     cterm=none ctermfg=16 ctermbg=8  gui=none guifg=Black guibg=#A0A0A0
highlight Todo       cterm=none ctermfg=9  ctermbg=none gui=none guifg=orangered guibg=yellow2

highlight MatchParen cterm=none ctermbg=9 ctermfg=15 guifg=white guibg=red

" YouCompleteMe
highlight Pmenu      cterm=none ctermfg=15 ctermbg=16 gui=none guifg=White guibg=Black
highlight PmenuSel   cterm=bold ctermfg=39 ctermbg=16 gui=bold guifg=Blue  guibg=Black

" set up some custom colors
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight SpellBad     ctermbg=0   ctermfg=1
highlight LineNr       ctermbg=none ctermfg=105
" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" GitGutter
highlight GitGutterAdd          ctermfg=40 ctermbg=none
highlight GitGutterChange       ctermfg=20 ctermbg=none
highlight GitGutterDelete       ctermfg=9  ctermbg=none
highlight GitGutterChangeDelete ctermfg=20 ctermbg=none

highlight CursorLine term=underline ctermfg=17 ctermbg=81 guifg=Black guibg=#5fd7ff gui=none
highlight CtrlPMatch ctermfg=16 ctermbg=81 cterm=bold guifg=Black guibg=#5fd7ff gui=bold
