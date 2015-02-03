;; OCaml config

(amaloz/ensure-module-deps '(tuareg))

(setq opam-share (substring (shell-command-to-string
                             "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)

(require 'ocp-indent)
(require 'merlin)

(add-to-list 'exec-path (substring (shell-command-to-string
                                    "opam config var bin 2> /dev/null") 0 -1))

;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)

;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
