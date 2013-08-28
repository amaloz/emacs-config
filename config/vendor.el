
(add-to-list 'load-path "~/.emacs.d/vendor/pkgbuild-mode")

(autoload 'pkgbuild-mode "pkgbuild-mode.el"
  "major mode for PKGBUILD files" t)

(setq auto-mode-alist
      (append '(("PKGBUILD\\'" . pkgbuild-mode))
              auto-mode-alist))
