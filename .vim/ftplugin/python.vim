if exists('b:did_ftplugin_python')
    finish
endif
let b:did_ftplugin_python = 1

" highlight 'self'
highlight pySelf cterm=bold ctermfg=214
match pySelf /self/
