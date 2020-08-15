(straight-use-package 'helm)

; Theme
(straight-use-package
  '(emacs-color-theme-solarize :type git :host github :repo "sellout/emacs-color-theme-solarized"))

; Auto Completion
(straight-use-package 'company)

;; Helm
(straight-use-package 'helm)
(straight-use-package 'helm-swoop)
(straight-use-package
  '(helm-gtags :type git :host github :repo "syohex/emacs-helm-gtags"))

;; Snippet
(straight-use-package 'yasnippet)

;; Validation
(straight-use-package 'flycheck)

;; C/C++
(straight-use-package 'irony)
(straight-use-package 'flycheck-irony)
(straight-use-package 'company-irony)
(straight-use-package 'company-irony-c-headers)
(straight-use-package 'clang-format)

;; Go
(straight-use-package 'go-mode)

;; Python
(straight-use-package 'elpy)

;; Verilog
(straight-use-package 'verilog-mode)

;; Json
(straight-use-package 'json-mode)

;; YAML
(straight-use-package 'yaml-mode)

;; TOML
(straight-use-package 'toml-mode)

;; jinja2
(straight-use-package 'jinja2-mode)

;; Build tool
(straight-use-package 'cmake-mode)

;; Misc
(straight-use-package 'editorconfig)
(straight-use-package 'expand-region)
(straight-use-package 'hide-comnt)
(straight-use-package 'powerline)
