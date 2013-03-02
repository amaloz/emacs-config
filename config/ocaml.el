; OCaml config
; 01 March 2013

(add-hook 'tuareg-mode-hook
          (lambda ()
            (setq tuareg-interactive-program "utop")
            (setq show-trailing-whitespace t)))
