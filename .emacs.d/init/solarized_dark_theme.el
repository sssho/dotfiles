;; theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/emacs-color-theme-solarized/")

(setq frame-background-mode 'dark)
(load-theme 'solarized t)

;; mode-line
(custom-set-faces
 '(mode-line
   ((t (:background "brightyellow" :foreground "black" :inverse-video t :box nil)))))

;; company
(custom-set-faces
 '(company-preview
   ((t (:background "green" :foreground "black"))))
 '(company-scrollbar-fg
   ((t (:background "yellow"))))
 '(company-tooltip-annotation
   ((t (:background "lightgray" :foreground "brightgreen"))))
 '(company-tooltip-search
   ((t (:inherit highlight :background "lightgray" :foreground "brightred"))))
 '(company-tooltip-search-selection
   ((t (:inherit highlight :background "lightgray" :foreground "brightred")))))

(set-face-attribute
 'company-tooltip nil
 :foreground "black" :background "lightgrey")
(set-face-attribute
 'company-tooltip-common nil
 :foreground "black" :background "lightgrey")
(set-face-attribute
 'company-tooltip-common-selection nil
 :foreground "white" :background "steelblue")
(set-face-attribute
 'company-tooltip-selection nil
 :foreground "black" :background "steelblue")
(set-face-attribute
 'company-preview-common nil
 :background nil :foreground "lightgrey" :underline t)
(set-face-attribute
 'company-scrollbar-fg nil
 :background "orange")
(set-face-attribute
 'company-scrollbar-bg nil
 :background "gray40")

;; helm
(custom-set-faces
 '(helm-header
   ((t (:background "black" :foreground "blue"))))
 '(helm-selection
   ((t (:background "black" :foreground "yellow"))))
 '(helm-swoop-target-line-face
   ((t (:background "black"))))
 '(helm-swoop-target-word-face
   ((t (:background "brightblack" :foreground "brightred")))))

;; ediff
(custom-set-faces
 '(ediff-current-diff-A
   ((t (:background "#335533"))))
 '(ediff-even-diff-A
   ((t (:background "#fdf6e3"))))
 '(ediff-even-diff-B
   ((t (:background "#fdf6e3"))))
 '(ediff-fine-diff-B
   ((t (:background "#aa2222"))))
 '(ediff-odd-diff-A
   ((t (:background "#fdf6e3"))))
 '(ediff-odd-diff-B
   ((t (:background "#fdf6e3")))))
