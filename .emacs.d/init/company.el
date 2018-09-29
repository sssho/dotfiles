;; company mode

(global-company-mode +1)

(custom-set-variables
    '(company-idle-delay 0)
    '(company-tooltip-idle-delay 0))

(global-set-key (kbd "C-M-i") 'company-complete)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-search-map (kbd "C-n") 'company-select-next)
(define-key company-search-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)
(define-key company-active-map (kbd "C-l") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)
(define-key company-active-map (kbd "C-i") 'company-complete-selection)

(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

(eval-after-load 'company
    '(add-to-list
         'company-backends '(company-irony-c-headers company-irony)))
