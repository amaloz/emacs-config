;; OCaml config
;; 01 March 2013

(amaloz/ensure-module-deps '(caml tuareg))

(add-to-list 'load-path "~/.opam/system/share/emacs/site-lisp/")
;; (require 'merlin)
;; (load-file "/home/amaloz/.opam/system/share/typerex/ocp-index/ocp-index.el")

(defun amaloz/ocaml-mode-defaults ()
  (setq tuareg-interactive-program "utop")
  (setq show-trailing-whitespace t))

(setq amaloz/ocaml-mode-hook 'amaloz/ocaml-mode-defaults)

(add-hook 'tuareg-mode-hook
          (lambda ()
            (run-hooks 'amaloz/ocaml-mode-hook)))
(add-hook 'tuareg-mode-hook 'merlin-mode)
