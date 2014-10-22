;; C config
;; 12 November 2013

(amaloz/ensure-module-deps '(yasnippet auto-complete-clang ecb))

(require 'cc-mode)

(after-load
 'c-mode
 (require 'ecb)
 (require 'ecb-autoloads)
 (setq ecb-layout-name "right1")
 (setq ecb-show-sources-in-directories-buffer 'always)
 (setq ecb-compile-window-height 12)
 (setq-default c-basic-offset 4 c-default-style "linux")
 (setq-default tab-width 4 indent-tabs-mode t)
 (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
 (require 'auto-complete-clang)
 (define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)
 )

