(require 'company)

(require 'cl-lib)

(defconst verilog-completions
  '("accept_on" "alias" "always" "always_comb" "always_ff" "always_latch" "and" "assert" "assign" "assume" "automatic" "before" "begin" "bind" "bins" "binsof" "bit" "break" "buf" "bufif0" "bufif1" "byte" "case" "casex" "casez" "cell" "chandle" "checker" "class" "clocking" "cmos" "config" "const" "constraint" "context" "continue" "cover" "covergroup" "coverpoint" "cross" "deassign" "default" "defparam" "design" "disable" "dist" "do" "edge" "else" "end" "endcase" "endchecker" "endclass" "endclocking" "endconfig" "endfunction" "endgenerate" "endgroup" "endinterface" "endmodule" "endpackage" "endprimitive" "endprogram" "endproperty" "endsequence" "endspecify" "endtable" "endtask" "enum" "event" "eventually" "expect" "export" "extends" "extern" "final" "first_match" "for" "force" "foreach" "forever" "fork" "forkjoin" "function" "generate" "genvar" "global" "highz0" "highz1" "if" "iff" "ifnone" "ignore_bins" "illegal_bins" "implies" "import" "incdir" "include" "initial" "inout" "input" "inside" "instance" "int" "integer" "interface" "intersect" "join" "join_any" "join_none" "large" "let" "liblist" "library" "local" "localparam" "logic" "longint" "macromodule" "matches" "medium" "modport" "module" "nand" "negedge" "new" "nexttime" "nmos" "nor" "noshowcancelled" "not" "notif0" "notif1" "null" "or" "output" "package" "packed" "parameter" "pmos" "posedge" "primitive" "priority" "program" "property" "protected" "pull0" "pull1" "pulldown" "pullup" "pulsestyle_ondetect" "pulsestyle_onevent" "pure" "rand" "randc" "randcase" "randsequence" "rcmos" "real" "realtime" "ref" "reg" "reject_on" "release" "repeat" "restrict" "return" "rnmos" "rpmos" "rtran" "rtranif0" "rtranif1" "s_always" "s_eventually" "s_nexttime" "s_until" "s_until_with" "scalared" "sequence" "shortint" "shortreal" "showcancelled" "signed" "small" "solve" "specify" "specparam" "static" "string" "strong" "strong0" "strong1" "struct" "super" "supply0" "supply1" "sync_accept_on" "sync_reject_on" "table" "tagged" "task" "this" "throughout" "time" "timeprecision" "timeunit" "tran" "tranif0" "tranif1" "tri" "tri0" "tri1" "triand" "trior" "trireg" "type" "typedef" "union" "unique" "unique0" "unsigned" "until" "until_with" "untyped" "use" "uwire" "var" "vectored" "virtual" "void" "wait" "wait_order" "wand" "weak" "weak0" "weak1" "while" "wildcard" "wire" "with" "within" "wor" "xnor" "xor" "`__FILE__" "`__LINE__" "`begin_keywords" "`celldefine" "`default_nettype" "`define" "`else" "`elsif" "`end_keywords" "`endcelldefine" "`endif" "`ifdef" "`ifndef" "`include" "`line" "`nounconnected_drive" "`pragma" "`resetall" "`timescale" "`unconnected_drive" "`undef" "`undefineall" "$display" "$displayb" "$displayh" "$displayo" "$dumpall" "$dumpfile" "$dumpflush" "$dumplimit" "$dumpoff" "$dumpon" "$dumpports" "$dumpportsall" "$dumpportsflush" "$dumpportslimit" "$dumpportsoff" "$dumpportson" "$dumpvars" "$fclose" "$fdisplay" "$fdisplayb" "$fdisplayh" "$fdisplayo" "$feof" "$ferror" "$fflush" "$fgetc" "$fgets" "$finish" "$fmonitor" "$fmonitorb" "$fmonitorh" "$fmonitoro" "$fopen" "$fread" "$fscanf" "$fseek" "$fstrobe" "$fstrobeb" "$fstrobeh" "$fstrobeo" "$ftell" "$fwrite" "$fwriteb" "$fwriteh" "$fwriteo" "$monitor" "$monitorb" "$monitorh" "$monitoro" "$monitoroff" "$monitoron" "$plusargs" "$random" "$readmemb" "$readmemh" "$rewind" "$sformat" "$sformatf" "$sscanf" "$strobe" "$strobeb" "$strobeh" "$strobeo" "$swrite" "$swriteb" "$swriteh" "$swriteo" "$test" "$ungetc" "$value$plusargs" "$write" "$writeb" "$writeh" "$writememb" "$writememh" "$writeo" "byte" "shortint" "int" "longint" "integer" "time" "bit" "logic" "reg" "supply0" "supply1" "tri" "triand" "trior" "tri0" "tri1" "trireg" "uwire" "wire" "wand" "wo" "shortreal" "real" "realtime"))

(defun company-verilog-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
    (interactive (company-begin-backend 'company-verilog-backend))
    (prefix (and (eq major-mode 'verilog-mode)
                 (company-grab-symbol)))
    (candidates
     (cl-remove-if-not
      (lambda (c) (string-prefix-p arg c))
      verilog-completions))))

(add-hook 'verilog-mode-hook
          '(lambda ()
             (set (make-local-variable 'company-backends)
                  (append '((company-verilog-backend company-files company-dabbrev company-yasnippet)) company-backends))))
