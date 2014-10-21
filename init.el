;; amaloz's emacs init.el file
;; 01 March 2013

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/config")

(setq custom-file "~/.emacs.d/config/custom.el")
(when (file-exists-p custom-file) (load custom-file))
(load-theme 'solarized-light t)

(load "private" t)
(load "packages")

(load "ui")
(load "functions")
(load "mode")
(load "global")

;;
;; specific modules (enable / disable as desired)
;;
(load "c")
(load "email")
(load "latex")
(load "ocaml")
(load "prog")
(load "python")
