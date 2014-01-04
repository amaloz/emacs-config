;; C config
;; 12 November 2013

(amaloz/ensure-module-deps '())

(defun amaloz/c-mode-defaults ()
  (setq c-basic-offset 4)
  (setq show-trailing-whitespace t))

(setq amaloz/c-mode-hook 'amaloz/c-mode-defaults)

(add-hook 'c-mode-common-hook
          (lambda ()
            (run-hooks 'amaloz/c-mode-hook)))
