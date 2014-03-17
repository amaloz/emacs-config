;; amaloz's emacs init.el file
;; 01 March 2013

(add-to-list 'load-path "~/.emacs.d")

(setq custom-file "~/.emacs.d/config/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(load "config/private" t)
(load "config/packages")

(load "config/ui")
(load "config/functions")
(load "config/mode")
(load "config/global")

;;
;; specific modules (enable / disable as desired)
;;
(load "config/c")
(load "config/email")
(load "config/git")
(load "config/latex")
(load "config/ocaml")
(load "config/prog")
(load "config/python")
