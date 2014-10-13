;; C config
;; 12 November 2013

(amaloz/ensure-module-deps '(auto-complete-clang ecb yasnippet))

(require 'cc-mode)
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)

(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-layout-name "right1")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)

(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; (defun amaloz/c-mode-defaults ()
;;   (setq c-basic-offset 4 c-default-style "linux")
;;   (setq show-trailing-whitespace t))

;; (setq amaloz/c-mode-hook 'amaloz/c-mode-defaults)

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (run-hooks 'amaloz/c-mode-hook)))
