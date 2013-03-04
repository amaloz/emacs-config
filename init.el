; amaloz's emacs init.el file
; 01 March 2013

(add-to-list 'load-path "~/.emacs.d")

(setq custom-file "~/.emacs.d/config/custom.el")
(when (file-exists-p custom-file) (load custom-file))

(load "config/packages")
(load "config/ui")
(load "config/funs")
(load "config/mode")
(load "config/global")

(load "config/prog")

; specific modules
(load "config/latex")
(load "config/ocaml")

; start up emacs server
;; (server-start)
