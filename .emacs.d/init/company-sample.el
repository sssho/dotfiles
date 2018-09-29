(require 'cl-lib)
(require 'company)

(defconst sample-completions
  '("alan" "john" "ada" "don" "fuuuk" "fuuuuuuuk" "fuuuuuuuuuuuk"))

(defun company-sample-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
        (interactive (company-begin-backend 'company-sample-backend))
        (prefix (and (eq major-mode 'fundamental-mode)
                     (company-grab-symbol)))
        (candidates
         (cl-remove-if-not
          (lambda (c) (string-prefix-p arg c))
             sample-completions))
      (meta (format "This value is named %s" arg))))

(add-to-list 'company-backends 'company-sample-backend)
