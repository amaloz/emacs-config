;; global configuration
;; 02 March 2013

(amaloz/ensure-module-deps '(dired+ dired-single flycheck
 flycheck-color-mode-line hide-comnt move-text pretty-mode-plus
 smart-mode-line))

(require 'dired-single)
(require 'dired+)
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
   loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer "..")))))
;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

(global-set-key [(f5)] 'dired-single-magic-buffer)
(global-set-key [(control f5)] (function
    (lambda nil (interactive)
        (dired-single-magic-buffer default-directory))))
(global-set-key [(shift f5)] (function
    (lambda nil (interactive)
        (message "Current directory is: %s" default-directory))))
(global-set-key [(meta f5)] 'dired-single-toggle-buffer-name)

(require 'flycheck)
(require 'flycheck-color-mode-line)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

(require 'hide-comnt)

(require 'move-text)
(move-text-default-bindings)

(require 'pretty-mode-plus)
(pretty-mode t)

(require 'smart-mode-line)
(if after-init-time (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

(require 'windmove)
(windmove-default-keybindings)


(setq-default indent-tabs-mode nil)     ; use spaces for tabs
(setq make-backup-files nil)            ; disable backup files
(setq-default tab-width 8)

(delete-selection-mode t)

(global-auto-revert-mode t)

(show-paren-mode t)

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

(icomplete-mode t)

(electric-pair-mode +1)
(electric-indent-mode +1)

(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))
(autoload 'flyspell-mode "flyspell" "On-the-fly spell-checker" t)

; default to text-mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'amaloz/enable-flyspell)

; global key bindings
(global-set-key [(shift return)] 'amaloz/smart-open-line)

(amaloz/global-mode t)
