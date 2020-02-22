if exists('b:did_ftplugin_go')
    finish
endif
let b:did_ftplugin_go = 1

" highlight 'err'
highlight goErr cterm=bold ctermfg=214
match goErr /\<err\>/

" ale
let b:ale_fixers = []
