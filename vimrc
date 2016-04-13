" Leader
let mapleader = "\<Space>"

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " prevent temporary files
set nowritebackup " prevent temporary files
set autowrite     " Automatically :write before running commands

filetype plugin indent on
set showmatch                     " show bracket matches
set clipboard=unnamed             " use the system clipboard
let g:rainbow_active = 1          " highlight parens with different colours

" 12<Enter> to go to line 12 / <Enter> to go to end of file
nnoremap <CR> G
" <Backspace> to go to beginning of file
nnoremap <BS> gg

" Ignore ex mode
nnoremap Q <ESC>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

nnoremap <Leader>w :w<CR>

" copy/paste with y/p
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Quickly select text you just pasted
noremap gV `[v`]
" enter visual mode with <space><space>
nmap <Leader><Leader> V

" region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

map <F3> :set hlsearch!<CR>

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

" Toggle TagbarToggle
map <F8> :TagbarToggle<CR>

" delete buffers
:nnoremap <Leader>q :Bdelete<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" switch buffers with F4
:nnoremap <F4> :buffers<CR>:buffer<Space>

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell spelllang=en_gb

  " The following command will let us press CTRL-N or CTRL-P in insert-mode to complete the word we’re typing!
  set complete+=kspell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal spell spelllang=en_gb textwidth=72 colorcolumn=51,73,81

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Ruby settings
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  " Make ? part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Save on focus lost
:au FocusLost * silent! wa
set autowriteall
set hidden

" Softtabs, 2 spaces
set shiftround

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " Highlight the search term
  let g:ag_highlight=1
endif

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif
" map git commands
map <leader>b :Gblame<cr>
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" map Silver Searcher
map <leader>a :Ag!<space>

" Numbers
set numberwidth=4

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_show_hidden = 1
" ignore stuff in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" toggle spell check with <F5>
map <F5> :setlocal spell! spelllang=en_gb<cr>
imap <F5> <ESC>:setlocal spell! spelllang=en_gb<cr>

" toggle Gundo with F6
nnoremap <F6> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_close_on_revert = 1

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags --tag-relative --extra=+f -Rf.git/tags --exclude=.git,pkg --languages=-javascript,sql<CR><CR>
set tags+=.git/tags

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>
let g:rspec_command = 'Dispatch rspec {spec}'

" Run commands that require an interactive shell
nnoremap <Leader>ri :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move lines around
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" configure syntastic syntax checking
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list=0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}
let g:syntastic_aggregate_errors=1

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint', 'jscs']

" CostCo settings for , and ;
autocmd FileType javascript,css nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

let g:bufferline_echo = 0

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode','paste'],
      \             ['fugitive','readonly','filename','modified','tagbar'],
      \             ['bufferline']
      \           ],
      \   'right': [ ['syntastic','lineinfo'],
      \              ['percent'],
      \              ['fileformat','fileencoding','filetype']
      \           ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'readonly': 'MyReadOnly',
      \   'modified': 'MyModified',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFileName',
      \   'fileformat': 'MyFileFormat',
      \   'filetype': 'MyFileType',
      \   'fileencoding': 'MyFileEncoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'bufferline': 'MyBufferLine',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! MyReadOnly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction
function! MyFileName()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadOnly() ? MyReadOnly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileFormat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyBufferLine()
  let st=g:bufferline#refresh_status()
  return g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
           \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

" Vim Javascript
let g:javascript_enable_domhtmlcss = 1

" Tmuxline
" let g:tmuxline_preset = 'full'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#h'}

" Promptline
" let g:promptline_theme = 'airlineish'
" let g:promptline_preset = {
"         \'a' : [ promptline#slices#user() ],
"         \'b' : [ promptline#slices#cwd() ],
"         \'c' : [ promptline#slices#vcs_branch(), promptline#slices#git_status() ],
"         \'z' : [ '%*' ],
"         \'warn' : [ promptline#slices#battery() ]}

" Split/Join lines
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Ruby Pry stuff
" Add the pry debug line with <Space>bp
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>
" Alias for one-handed operation:
map <Leader><Leader>p <Leader>bp

" Keep pry from annoyingly hanging around when using, e.g. pry-rescue/minitest
map <f7> :wa<cr>:call system('kill-pry-rescue')<cr>

" Nab lines from ~/.pry_history (respects "count")
nmap <Leader>ph :<c-u>let pc = (v:count1 ? v:count1 : 1)<cr>:read !tail -<c-r>=pc<cr> ~/.pry_history<cr>:.-<c-r>=pc-1<cr>:norm <c-r>=pc<cr>==<cr>
" ↑ thanks to Houl, ZyX-i, and paradigm of #vim for all dogpiling on this one.

" RSpec.vim mappings
map <Leader>t :w<CR>:call RunCurrentSpecFile()<CR>
map <Leader>s :w<CR>:call RunNearestSpec()<CR>
map <Leader>l :w<CR>:call RunLastSpec()<CR>
map <Leader>at :w<CR>:call RunAllSpecs()<CR>

let g:rspec_command = "Dispatch rspec {spec}"

map <Leader>rn :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
