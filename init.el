(require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/config")
(setq custom-file "~/.emacs.d/config/custom.el")
(when (file-exists-p custom-file) (load custom-file))
(load-theme 'solarized-light t)

(load "init-packages")

(load "init-ui")
(load "init-funcs")
;; (load "init-mode")

(load "init-utils")

(load "init-auto-complete")
(load "init-dired")
(load "init-flycheck")
(load "init-flyspell")
(load "init-ido")
(load "init-misc")
(load "init-yasnippet")
(load "init-compile")

;;
;; specific modules (enable / disable as desired)
;;
(load "init-c")
;; (load "init-email")
(load "init-latex")
(load "init-ocaml")
(load "init-prog")
(load "init-proofgeneral")
(load "init-python")
(load "init-markdown")
(load "init-w3m")
(load "init-haskell")
