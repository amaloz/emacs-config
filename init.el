;; amaloz's emacs init.el file
;; 01 March 2013

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elisp")

(setq custom-file "~/.emacs.d/config/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(load "config/private" t)
(load "config/packages")

(load "config/ui")
(load "config/functions")
(load "config/mode")
(load "config/global")

;; specific modules (enable / disable as desired)
(load "config/email")
;; (load "config/erc")
(load "config/latex")
(load "config/ocaml")
;; (load "config/org")
(load "config/prog")
;; (load "config/proofgeneral")
