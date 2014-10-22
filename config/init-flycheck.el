(amaloz/ensure-module-deps '(flycheck flycheck-color-mode-line))

(require 'flycheck)
(require 'flycheck-color-mode-line)

(add-hook 'after-init-hook 'global-flycheck-mode)
;; disable emacs flycheck
(eval-after-load 'flycheck
  '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

