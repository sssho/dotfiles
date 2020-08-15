;; set loaded emacs setting file dir to user-emacs-directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(setq user-elisp-directory (concat user-emacs-directory "elisp/"))
(add-to-list 'load-path user-elisp-directory)

(defvar bootstrap-version)
(let ((bootstrap-file
        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-check-for-modifications '(never))

(straight-use-package 'init-loader)

;; init-loader
(custom-set-variables
  '(init-loader-show-log-after-init 'error-only))
(init-loader-load (locate-user-emacs-file "init-loader"))
