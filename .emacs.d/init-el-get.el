(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

;;(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;;(el-get 'sync)

(el-get-bundle init-loader)

; Theme
(el-get-bundle sellout/emacs-color-theme-solarized)

; Auto Completion
(el-get-bundle company-mode/company-mode :name company-mode)

;; Helm
(el-get-bundle helm)
(el-get-bundle helm-swoop)
(el-get-bundle syohex/emacs-helm-gtags :name helm-gtags)

;; Snippet
(el-get-bundle yasnippet)

;; Validation
(el-get-bundle flycheck)

;; C/C++
(el-get-bundle irony)
(el-get-bundle flycheck-irony)
(el-get-bundle company-irony)
(el-get-bundle company-irony-c-headers)
(el-get-bundle clang-format
  :type http
  :url "https://llvm.org/svn/llvm-project/cfe/trunk/tools/clang-format/clang-format.el")

;; Go
(el-get-bundle go-mode)

;; Python
(el-get-bundle elpy)

;; Verilog
(el-get-bundle verilog-mode
  :type http
  :url "https://www.veripool.org/ftp/verilog-mode.el")

;; Json
(el-get-bundle json-mode)

;; YAML
(el-get-bundle yaml-mode)

;; Build tool
(el-get-bundle cmake-mode)

;; Misc
(el-get-bundle editorconfig)
(el-get-bundle expand-region)
(el-get-bundle emacsmirror/hide-comnt)
(el-get-bundle powerline)
