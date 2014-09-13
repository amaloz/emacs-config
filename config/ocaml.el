;; OCaml config

(amaloz/ensure-module-deps '(tuareg))

(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)

(require 'ocp-indent)
(require 'merlin)

(add-to-list 'exec-path "/home/amaloz/.opam/4.01.0/bin")

;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
;; (add-hook 'caml-mode-hook 'merlin-mode t)

;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)

;; (defun amaloz/ocaml-mode-defaults ()
;;   (setq tuareg-interactive-program "utop")
;;   (setq tuareg-in-indent 0)
;;   (setq tuareg-default-indent 2)
;;   (setq default-tab-width 2)
;;   (setq show-trailing-whitespace t))

;; (setq amaloz/ocaml-mode-hook 'amaloz/ocaml-mode-defaults)

;; (add-hook 'tuareg-mode-hook
;;           (lambda ()
;;             (run-hooks 'amaloz/ocaml-mode-hook)))
;; (add-hook 'tuareg-mode-hook 'merlin-mode)
