if exists('b:did_ftplugin_sh')
    finish
endif
let b:did_ftplugin_sh = 1

let g:ale_sh_shfmt_options = '-i 4 -ci'
let b:ale_fixers = ['shfmt']

nnoremap <Leader>F :<C-u>ALEFix<CR>
