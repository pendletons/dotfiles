let g:fzf_action = {
                                                      \ 'ctrl-t': 'tab split',
                                                      \ 'ctrl-x': 'split',
                                                      \ 'ctrl-v': 'vsplit' }

nmap <Leader>f :FzfPreviewProjectFilesRpc<CR>
nmap <Leader>b :FzfPreviewBuffersRpc<CR>

" searching
nnoremap          <Leader>a     :FzfPreviewProjectGrepRpc<Space>
" location list
nnoremap <silent> <Leader>l     :FzfPreviewLocationListRpc<CR>

" git status
nnoremap <silent> <Leader>gs    :FzfPreviewGitStatusRpc<CR>
" git actions (branch, log, stash, etc.)
nnoremap <silent> <Leader>ga    :FzfPreviewGitActionsRpc<CR>
" show quickfix window
nnoremap <silent> <Leader>qf    :FzfPreviewQuickFixRpc<CR>

" nnoremap <silent> <Leader>g;    :FzfPreviewChangesRpc<CR>
nnoremap <silent> <Leader>B     :FzfPreviewAllBuffersRpc<CR>
" Select files from selected resources (project, git, directory, buffer, project_old, project_mru, project_mrw, old, mru, mrw)
nnoremap <silent> <Leader>o     :FzfPreviewFromResourcesRpc buffer project_mru<CR>
" Select line from current buffer
" nnoremap <silent> <Leader>/     :FzfPreviewLinesRpc --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>

" file picker
xmap <Leader>f :FzfPreviewProjectFilesRpc<CR>
" project search - visual mode
xnoremap <Leader>gr    "sy:FzfPreviewProjectGrepRpc<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
