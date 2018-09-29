;; smartrep

(require 'smartrep)

(global-unset-key "\C-t")
(smartrep-define-key
 global-map "C-t"
 '(("n" . 'mc/mark-next-like-this-word)
   ("p" . 'mc/mark-previous-like-this-word)
   ("m" . 'mc/mark-more-like-this-extended)
   ("u" . 'mc/unmark-next-like-this)
   ("U" . 'mc/unmark-previous-like-this)
   ("s" . 'mc/skip-to-next-like-this)
   ("S" . 'mc/skip-to-previous-like-this)
   ("*" . 'mc/mark-all-like-this)
   ("d" . 'mc/mark-all-like-this-dwim)
   ("i" . 'mc/insert-numbers)
   ("o" . 'mc/sort-regions)
   ("O" . 'mc/reverse-regions)))
