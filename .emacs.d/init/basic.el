(require 'server)
(unless (server-running-p)
  (server-start))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq inhibit-startup-message t)

(setq make-backup-files nil)

(setq visible-bell t)

(setq ring-bell-function 'ignore)

(menu-bar-mode -1)

(tool-bar-mode -1)

(global-linum-mode t)

(global-hl-line-mode t)

(column-number-mode t)

(line-number-mode t)

(setq kill-whole-line t)

(setq-default tab-width 4)

(setq-default indent-tabs-mode nil)

(setq scroll-step 1)

(delete-selection-mode t)

(transient-mark-mode t)

(setq x-select-enable-clipboard t)

(setq recentf-max-saved-items 2000)
(setq recentf-auto-cleanup 'never)
(setq recentf-exclude '("/recentf"))
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)
