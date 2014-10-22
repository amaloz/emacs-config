(amaloz/ensure-module-deps '(python-mode))

(defun amaloz/python-mode-defaults ()
  (setq show-trailing-whitespace t)
  (setq-default py-shell-name "ipython2")
  (setq-default py-which-bufname "IPython2")
  ;; XXX: disable flycheck mode for now
  (flycheck-mode 0)
  (local-set-key (kbd "C-M-n") 'py-down-block)
  (local-set-key (kbd "C-M-p") 'py-up-block)
  )

(setq amaloz/python-mode-hook 'amaloz/python-mode-defaults)

(add-hook 'python-mode-hook
          (lambda ()
            (run-hooks 'amaloz/python-mode-hook)))
(add-hook 'python-mode-hook '(lambda ()
                               (local-set-key (kbd "RET") 'newline-and-indent)))
