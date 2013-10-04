
(amaloz/ensure-module-deps '(muttrc-mode))

(require 'muttrc-mode)

(add-to-list 'auto-mode-alist '("mutt-*" . mail-mode))
(add-to-list 'auto-mode-alist '("muttrc\\'" . muttrc-mode))

(defun my-mail-mode-hook ()
  (auto-fill-mode 1)
  (abbrev-mode 1)
  (local-set-key "\C-Xk" 'server-edit))
(add-hook 'mail-mode-hook 'my-mail-mode-hook)
