(amaloz/ensure-module-deps '(pydoc-info python-mode))

(require 'python)
(require 'pydoc-info)

(setq
 show-trailing-whitespace t
 python-shell-interpreter "ipython2"
 python-shell-interpreter-args "--gui=wx --matplotlib=wx --colors=Linux"
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(defun amaloz/python-mode-defaults ()
  ;; ;; XXX: disable flycheck mode for now
  ;; (flycheck-mode 0)
  (local-set-key (kbd "C-M-n") 'py-down-block)
  (local-set-key (kbd "C-M-p") 'py-up-block)
  )

(setq amaloz/python-mode-hook 'amaloz/python-mode-defaults)

(add-hook 'python-mode-hook
          (lambda ()
            (run-hooks 'amaloz/python-mode-hook)))
(add-hook 'python-mode-hook '(lambda ()
                               (local-set-key (kbd "RET") 'newline-and-indent)))
