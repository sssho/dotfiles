;; YASnippet

(custom-set-variables
    '(yas-snippet-dirs (list (concat user-emacs-directory "snippets"))))

(yas-global-mode 1)
;(define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)
;(define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c TAB") 'yas-expand)
(define-key yas-minor-mode-map (kbd "C-c y") 'helm-yas-complete)
