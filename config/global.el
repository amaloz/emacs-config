; configure package manager
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
        "http://marmalade-repo.org/packages/"))
(package-initialize)

; general config
(global-hl-line-mode 1)                 ; highlight current line
(setq-default indent-tabs-mode nil)     ; use spaces for tabs
(setq make-backup-files nil)            ; disable backup files
(line-number-mode 1)                    ; show line number
(column-number-mode 1)                  ; show column number
(setq-default fill-column 80)
(global-linum-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(ido-mode 1)

; default to text-mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)

; fix scrolling (maybe?)
(setq scroll-margin 0 scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(define-key global-map (kbd "RET") 'newline-and-indent)

(defun kill-and-join-forward (&optional arg)
  (interactive "P")
  (if (and (eolp) (not (bolp)))
    (delete-indentation t)
    (kill-line arg)))
(global-set-key "\C-k" 'kill-and-join-forward)

