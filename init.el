; amaloz's emacs init.el file
; 01 March 2013

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elisp")
;; (add-to-list 'load-path "~/.emacs.d/vendor/erc-sasl")

(setq custom-file "~/.emacs.d/config/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(load "config/private" t)
(load "config/packages")
; turn on flymake for all applicable file types
;; (require 'flymake)
;; (add-hook 'find-file-hook 'flymake-find-file-hook)

(load "config/ui")
(load "config/funs")
(load "config/mode")
(load "config/global")

(load "config/prog")

; specific modules
(load "config/email")
(load "config/erc")
(load "config/latex")
(load "config/ocaml")
(load "config/ruby")

