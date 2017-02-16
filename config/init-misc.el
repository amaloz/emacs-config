;; global configuration
;; 02 March 2013

;; (amaloz/ensure-module-deps '(auto-complete
;;                              fill-column-indicator
;; ;;                             git-commit-mode
;;                              hide-comnt
;;                              move-text
;;                              pretty-mode-plus
;;                              smart-mode-line))

;; (require 'hide-comnt)

;; (require 'move-text)
;; (move-text-default-bindings)

;; (require 'pretty-mode-plus)
;; (pretty-mode t)

;; (require 'smart-mode-line)
;; (if after-init-time (sml/setup)
;;   (add-hook 'after-init-hook 'sml/setup))

;; (require 'windmove)
;; (windmove-default-keybindings)

(setq-default indent-tabs-mode nil)     ; use spaces for tabs
(setq make-backup-files nil)            ; disable backup files
(setq-default tab-width 8)

(delete-selection-mode t)

(global-auto-revert-mode t)

(show-paren-mode t)

(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)

(icomplete-mode t)

(electric-pair-mode t)
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
    t))
(defun electric-indent-ignore-markdown (char)
  "Ignore electric indentation for markdown-mode"
  (if (equal major-mode 'markdown-mode)
      `no-indent'
    t))
(add-to-list 'electric-indent-functions 'electric-indent-ignore-python)
(add-to-list 'electric-indent-functions 'electric-indent-ignore-markdown)
(electric-indent-mode t)

; default to text-mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'amaloz/enable-flyspell)

; global key bindings
;; (global-set-key [(shift return)] 'amaloz/smart-open-line)

;; (amaloz/global-mode t)
