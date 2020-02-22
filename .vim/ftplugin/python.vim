if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

" jedi-vim
" Use only rename feature, for others, use pyls instead
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0
let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_stubs_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = ""
let g:jedi#usages_command = ""
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>r"

" highlight 'self'
highlight pySelf cterm=bold ctermfg=214
match pySelf /self/
