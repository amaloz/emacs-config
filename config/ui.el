(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(blink-cursor-mode -1)

(setq inhibit-startup-screen t)

(setq scroll-margin 0 scroll-conservatively 10000
  scroll-preserve-screen-position 1)

(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(fset 'yes-or-no-p 'y-or-no-p)

(setq-default fill-column 80)
(global-linum-mode 1)
(global-hl-line-mode 1)

(load-theme 'zenburn t)
