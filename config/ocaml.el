;; OCaml config
;; 01 March 2013

(amaloz/ensure-module-deps '(merlin tuareg utop))

(add-to-list 'load-path "~/.opam/system/share/emacs/site-lisp")

(require 'auto-complete)
(require 'merlin)
(require 'tuareg)

(setq auto-mode-list
      (append '(("\\.ml[ily]?$" . tuareg-mode))
              auto-mode-alist))

;; From https://github.com/realworldocaml/book/wiki/Installation-Instructions

;; Setup environment variables using opam
(dolist
    (var (car (read-from-string
               (shell-command-to-string "opam config env --sexp"))))
  (setenv (car var) (cadr var)))
;; Update the emacs path
(setq exec-path (split-string (getenv "PATH") path-separator))
;; Update the emacs load path
(push (concat (getenv "OCAML_TOPLEVEL_PATH")
              "/../../share/emacs/site-lisp") load-path)
;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)

(setq opam-share (substring (shell-command-to-string "opam config var share") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(defun amaloz/ocaml-mode-defaults ()
  (define-key merlin-mode-map
    (kbd "C-c <up>") 'merlin-type-enclosing-go-up)
  (define-key merlin-mode-map
    (kbd "C-c <down>") 'merlin-type-enclosing-go-down)
  (set-face-background 'merlin-type-face "#88FF44")
  (setq merlin-use-auto-complete-mode t)
  (setq merlin-error-after-save nil)
  (setq tuareg-interactive-program "utop")
  (setq tuareg-in-indent 0)
  (setq tuareg-default-indent 2)
  (setq default-tab-width 2)
  (setq show-trailing-whitespace t))
(setq amaloz/ocaml-mode-hook 'amaloz/ocaml-mode-defaults)

(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'tuareg-mode-hook 'auto-complete-mode)
(add-hook 'tuareg-mode-hook
          (lambda ()
            (run-hooks 'amaloz/ocaml-mode-hook)))
