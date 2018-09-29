;; set loaded emacs setting file dir to user-emacs-directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(setq user-elisp-directory (concat user-emacs-directory "elisp/"))

(add-to-list 'load-path user-elisp-directory)

(load (concat user-emacs-directory "init-el-get.el"))

;; package.el
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("MELPA Stable" . "https://stable.melpa.org/packages/") t)
;; (package-initialize)

;; init-loader
(custom-set-variables
 '(init-loader-show-log-after-init 'error-only))
(init-loader-load (locate-user-emacs-file "init-loader"))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
