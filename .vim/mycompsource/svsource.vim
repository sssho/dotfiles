" asyncomplete source
function! s:sv_completor(opt, ctx) abort
    let l:col = a:ctx['col']
    let l:typed = a:ctx['typed']

    let l:kw = matchstr(l:typed, '\v\S+$')
    let l:kwlen = len(l:kw)

    let l:startcol = l:col - l:kwlen

    let l:matches = [
        \ "always", "always_comb", "always_ff", "always_latch", "assert",
        \ "assign", "assume", "automatic", "before", "begin",
        \ "bind", "bins", "binsof", "break", "byte",
        \ "case", "casex", "casez", "chandle", "checker",
        \ "class", "clocking", "const", "constraint", "continue",
        \ "cover", "covergroup", "coverpoint", "cross", "default",
        \ "defparam", "disable", "dist", "else", "endcase",
        \ "endclass", "endclocking", "endfunction", "endgenerate", "endinterface",
        \ "endmodule", "endpackage", "endprogram", "endproperty", "endsequence",
        \ "endtask", "enum", "event", "expect", "export",
        \ "extends", "extern", "final", "first_match", "force",
        \ "foreach", "forever", "fork", "function", "generate",
        \ "genvar", "global", "ignore_bins", "illegal_bins", "import",
        \ "incdir", "include", "initial", "inout", "input",
        \ "inside", "integer", "interface", "intersect", "join",
        \ "join_any", "join_none", "local", "localparam", "logic",
        \ "longint", "modport", "module", "negedge", "null",
        \ "output", "package", "packed", "parameter", "posedge",
        \ "program", "property", "protected", "pure", "rand",
        \ "randc", "randcase", "randsequence", "real", "realtime",
        \ "release", "repeat", "return", "sequence", "shortint",
        \ "shortreal", "signed", "solve", "static", "string",
        \ "struct", "super", "task", "this", "throughout",
        \ "time", "timeprecision", "timeunit", "type", "typedef",
        \ "union", "unique", "unsigned", "virtual", "void",
        \ "wait", "while", "wire", "with", "within"
        \ ]

    call asyncomplete#complete(a:opt['name'], a:ctx, l:startcol, l:matches)
endfunction

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'systemverilog',
    \ 'whitelist': ['systemverilog'],
    \ 'completor': function('s:sv_completor'),
    \ })
