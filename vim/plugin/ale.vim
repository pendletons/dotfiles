let g:ale_sign_error = '!!'
let g:ale_sign_warning = '>>'
let g:ale_lint_delay = 250
let g:ale_fix_on_save = 1
let g:ale_open_list = 0
let g:ale_set_quickfix = 0
let g:ale_history_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

" let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }

" Do not lint or fix minified files.
let g:ale_pattern_options = {
      \ '\/node_modules\/': {'ale_linters': [], 'ale_fixers': []},
      \ '\/gems\/': {'ale_linters': [], 'ale_fixers': []},
      \}
