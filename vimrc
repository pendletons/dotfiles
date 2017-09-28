" Leader
let mapleader = "\<Space>"

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup      " prevent temporary files
set nowritebackup " prevent temporary files
set autowrite     " Automatically :write before running commands

filetype plugin indent on
set showmatch                     " show bracket matches
" set clipboard=unnamed             " use the system clipboard
let g:rainbow_active = 1          " highlight parens with different colours

" 12<Enter> to go to line 12 / <Enter> to go to end of file
nnoremap <CR> G
" <Backspace> to go to beginning of file
nnoremap <BS> gg

" Ignore ex mode
nnoremap Q <ESC>

nnoremap <Leader>w :w<CR>
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

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Save on focus lost
:au BufLeave,FocusLost,VimResized * silent! wa
set autowriteall
set hidden
set autoread " update buffer on external file change

let g:rainbow_active = 1          " highlight parens with different colours"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

nnoremap <Leader>w :w<CR>

" open fold on space
nnoremap <Space><Space> za

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
au FileType ruby setl sw=2 sts=2 et

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

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal spell spelllang=en_gb textwidth=72 colorcolumn=51,73,81

  " Ruby settings
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=? " Make ? part of words

  " ALE linting events
  if g:has_async
    set updatetime=1000
    let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Lint()
    autocmd CursorHoldI * call ale#Lint()
    autocmd InsertEnter * call ale#Lint()
    autocmd InsertLeave * call ale#Lint()
  else
    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  endif
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
set tabstop=2
set expandtab

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
map <leader>a :Ack!<space>
let g:ack_use_dispatch = 1
let g:ack_autofold_results = 1
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

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

let g:ag_lhandler="topleft lopen"

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
imap <F5> <ESC>:setlocal spell! spelllang=en_gb<cr>"

" toggle Gundo with F6
nnoremap <F6> :GundoToggle<CR>
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_close_on_revert = 1"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags --tag-relative --extra=+f -Rf.git/tags --exclude=.git,pkg --languages=-javascript,sql<CR><CR>
set tags+=.git/tags"

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>ta :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>
let g:rspec_command = 'Dispatch spring rspec {spec}'

let test#strategy = "dispatch"

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
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list=0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_ruby_rubocop_exec = '~/code/rubocop.sh'
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}
let g:syntastic_aggregate_errors=1

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['eslint', 'jscs']

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %"

" Linting
let g:ale_lint_on_text_changed = 'never'

" Startify
let g:startify_custom_header = [
  \ '                            _ ____',
  \ '                          /( ) _   \',
  \ '                         / //   /\` \,  ||--||--||-',
  \ '                           \|   |/  \|  ||--||--||-',
  \ '                     ~^~^~^~~^~~~^~~^^~^^^^^^^^^^^^',
  \ ]

" Colours
colorscheme grb256
highlight SpellCap guifg=Black ctermfg=Black cterm=bold
highlight Comment ctermfg=45 guifg=#A1EFFB
highlight LineNr ctermbg=none ctermfg=105

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
