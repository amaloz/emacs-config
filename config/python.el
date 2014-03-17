;; Python config
;; 11 November 2013

(amaloz/ensure-module-deps '(python-mode))

;; (require 'python-mode)
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun amaloz/python-mode-defaults ()
  (setq show-trailing-whitespace t)
  (setq-default py-shell-name "ipython2")
  (setq-default py-which-bufname "IPython2")
  ;; (setq py-python-command-args
  ;;       '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
  ;; (setq py-force-py-shell-name-p t)
  ;; (setq py-shell-switch-buffers-on-execute-p t)
  ;; (setq py-switch-buffers-on-execute-p t)
  ;; (setq py-split-windows-on-execute-p nil)
  ;; (setq py-smart-indentation t)
  ;; (setq python-shell-interpreter "ipython")
  ;; (setq python-shell-interpreter-args "")
  ;; (setq python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
  ;; (setq python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: ")
  ;; (setq python-indent-offset 4)
  ;; jedi setup
  ;; (setq jedi:setup-keys t)
  ;; (setq jedi:complete-on-dot t)
  ;; elpy setup
  ;; (setq elpy-rpc-backend "jedi")
  ;; (elpy-use-ipython)
  ;; (elpy-enable)
  ;; XXX: disable flycheck mode for now
  (flycheck-mode 0)
  (local-set-key (kbd "C-M-n") 'py-down-block)
  (local-set-key (kbd "C-M-p") 'py-up-block)
  ;; (setq flycheck-python-pylint-executable "pylint2")
  ;; (flycheck-select-checker "python-pylint")
  )

(setq amaloz/python-mode-hook 'amaloz/python-mode-defaults)

(add-hook 'python-mode-hook
          (lambda ()
            (run-hooks 'amaloz/python-mode-hook)))
;; (add-hook 'python-mode-hook 'auto-complete-mode)
;; (add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook '(lambda ()
                               (local-set-key (kbd "RET") 'newline-and-indent)))
