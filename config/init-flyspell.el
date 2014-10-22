(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))
(autoload 'flyspell-mode "flyspell" "On-the-fly spell-checker" t)

(if (fboundp 'prog-mode)
	(add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (dolist (hook '(lisp-mode-hook
				  emacs-lisp-mode-hook
				  scheme-mode-hook
				  python-mode-hook
				  shell-mode-hook
				  caml-mode-hook))
	(add-hook hook 'flyspell-prog-mode)))
(add-hook 'git-commit-mode-hook 'flyspell-mode-on)

