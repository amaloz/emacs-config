;; Python config
;; 11 November 2013

(amaloz/ensure-module-deps '(elpy jedi))

(defun amaloz/python-mode-defaults ()
  (setq show-trailing-whitespace t)
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "")
  (setq python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
  (setq python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: ")
  (setq python-indent-offset 4)
  ;; jedi setup
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  ;; elpy setup
  ;; (setq elpy-rpc-backend "jedi")
  ;; (elpy-use-ipython)
  ;; (elpy-enable)
  )

(setq amaloz/python-mode-hook 'amaloz/python-mode-defaults)

(add-hook 'python-mode-hook
          (lambda ()
            (run-hooks 'amaloz/python-mode-hook)))
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook '(lambda ()
                               (local-set-key (kbd "RET") 'newline-and-indent)))
