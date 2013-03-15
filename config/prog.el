; prog-mode configuration
; 02 March 2013

(amaloz/ensure-module-deps '(guru-mode))

(defun prog-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

(require 'which-func)
(setq which-func-modes t)
(which-function-mode 1)

(add-hook 'prog-mode-hook
          (lambda ()
            (prog-add-watchwords)))
