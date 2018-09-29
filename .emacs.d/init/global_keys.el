(global-set-key "\C-h" 'delete-backward-char)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

;; expand-region
(global-set-key (kbd "M-i") 'er/expand-region)
;;(global-set-key (kbd "C-M-@") 'er/contract-region)
