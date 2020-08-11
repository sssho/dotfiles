;; verilog

(require 'verilog-mode)

(add-to-list 'auto-mode-alist '("\\.v\\'" . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.sv\\'" . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.svh\\'" . verilog-mode))
(add-to-list 'auto-mode-alist '("\\.sva\\'" . verilog-mode))

(custom-set-variables
  '(verilog-auto-endcomments nil)
  '(verilog-auto-indent-on-newline nil)
  '(verilog-auto-newline nil)
  '(verilog-indent-lists nil)
  '(verilog-auto-lineup nil)
  '(verilog-highlight-grouping-keywords t))
