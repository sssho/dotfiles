(electric-pair-mode t)

(setq electric-pair-pairs '((?\' . ?\')
                               (?\{ . ?\})))

(show-paren-mode 1)

(set-face-attribute 'show-paren-match nil
  :background "#ff000000" :foreground nil
  :underline nil :weight 'extra-bold)
