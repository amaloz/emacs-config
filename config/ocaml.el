;; OCaml config
;; 01 March 2013

(amaloz-ensure-module-deps '(tuareg))

(defun amaloz-ocaml-mode-defaults ()
  (setq tuareg-interactive-program "utop")
  (setq show-trailing-whitespace t))

(setq amaloz-ocaml-mode-hook 'amaloz-ocaml-mode-defauts)

(add-hook 'tuareg-mode-hook
          (lambda ()
            (run-hooks 'amaloz-ocaml-mode-hook)))
