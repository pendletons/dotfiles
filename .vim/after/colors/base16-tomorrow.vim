" Line numbers
highlight LineNr ctermbg=none ctermfg=105

" GitGutter
highlight clear SignColumn
highlight GitGutterAdd          ctermfg=NONE ctermbg=NONE gui=bold guifg=#00d700 guibg=#008700
highlight GitGutterChange       ctermfg=NONE ctermbg=NONE gui=bold guifg=#0000d7 guibg=#0000af
highlight GitGutterDelete       ctermfg=NONE ctermbg=NONE gui=bold guifg=#ff0000  guibg=#800000
highlight GitGutterChangeDelete ctermfg=NONE ctermbg=NONE gui=bold guifg=#0000d7 guibg=#0000af

highlight DiffAdd    cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffDelete cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffChange cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guifg=#00ff00 guibg=#00005f
highlight DiffText   cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guifg=#00ff00 guibg=#870000

highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guifg=#000000 guibg=#A0A0A0
highlight Folded     cterm=NONE ctermfg=NONE ctermbg=NONE guifg=#000000 guibg=#A0A0A0
highlight Todo       cterm=NONE ctermfg=NONE ctermbg=NONE guifg=#ff0000 guibg=#ffff00

highlight MatchParen cterm=NONE ctermbg=NONE ctermfg=NONE guifg=#ffffff guibg=#00a000

" YouCompleteMe
highlight Pmenu      cterm=NONE ctermfg=NONE ctermbg=NONE guifg=#ffffff guibg=#000000
highlight PmenuSel   cterm=bold ctermfg=NONE ctermbg=NONE gui=bold guifg=#00afff  guibg=#000000

" set up some custom colors
highlight IncSearch    ctermbg=NONE ctermfg=NONE guifg=#800000 guibg=#808000
highlight Search       ctermbg=NONE ctermfg=NONE guifg=#800000 guibg=#000000
highlight SpellBad     ctermbg=NONE ctermfg=NONE guifg=#800000 guibg=#000000
highlight LineNr       ctermbg=NONE ctermfg=NONE guifg=#8787ff guibg=NONE

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=NONE guibg=#ff0000
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
