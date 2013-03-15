;; Ruby config
;; 06 March 2013

(amaloz/ensure-module-deps '(robe ruby-block ruby-end ruby-tools))

(defun amaloz/ruby-mode-defaults ()
  (robe-mode t)
  (ruby-end-mode t)
  (ruby-tools-mode t))

(setq amaloz/ruby-mode-hook 'amaloz/ruby-mode-defaults)

(add-hook 'ruby-mode-hook
          (lambda ()
            (run-hooks 'amaloz/ruby-mode-hook)))
