
(setq auto-mode-alist
      (append '(("~/.mutt/tmp/mutt-*". mail-mode))
              auto-mode-alist))

(autoload 'muttrc-mode "muttrc-mode.elc"
  "Major mode to edit muttrc files" t)

(setq auto-mode-alist
      (append '(("muttrc\\'" . muttrc-mode))
              auto-mode-alist))
