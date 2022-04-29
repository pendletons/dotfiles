" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
map <F9> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
set encoding=UTF-8 " for fancy icons

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ***** Directory handling *****
" Values: 0, 1, 2, or 3.
" Default: 0.

" Use this setting to tell the script when (if at all) to change the current
" working directory (CWD) for vim.

" If it is set to 0 then the CWD is never changed by the NERDTree.

" If set to 1 then the CWD is changed when the NERDTree is first loaded to the
" directory it is initialized in. For example, if you start the NERDTree with >
    " :NERDTree /home/marty/foobar
" <
" then the CWD will be changed to /home/marty/foobar and will not be changed
" again unless you init another NERDTree with a similar command.

" If the setting is set to 2 then it behaves the same as if set to 1 except that
" the CWD is changed whenever the tree root is changed. For example, if the CWD
" is /home/marty/foobar and you make the node for /home/marty/foobar/baz the new
" root then the CWD will become /home/marty/foobar/baz.

" If the set to 3, then it behaves the same as if set to 2, and the CWD is
" changed whenever changing tabs to whatever the tree root is on that tab.
let NERDTreeChDirMode=0
