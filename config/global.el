;; global configuration
;; 02 March 2013

(amaloz/ensure-module-deps '(move-text pretty-mode-plus))

(require 'move-text)
(move-text-default-bindings)

(require 'pretty-mode-plus)
(pretty-mode t)

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
