;; Elpy

(elpy-enable)

(setq elpy-rpc-backend "jedi")

(when (require 'flycheck nil t)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-hook 'elpy-mode-hook 'flycheck-mode))
