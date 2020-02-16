if exists('g:load_black')
    autocmd BufWritePre *.py :py3 Black()
endif
