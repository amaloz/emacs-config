
(setq-default indent-tabs-mode nil)     ; use spaces for tabs
(setq make-backup-files nil)            ; disable backup files
(setq-default tab-width 8)

(delete-selection-mode t)

;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" . ,temporary-file-directory t)))

(global-auto-revert-mode t)

(require 'windmove)
(windmove-default-keybindings)

(show-paren-mode t)

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10)

(icomplete-mode t)

(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))
(autoload 'flyspell-mode "flyspell" "On-the-fly spell-checker" t)

(defun amaloz-enable-flyspell ()
  (when (executable-find ispell-program-name)
    (flyspell-mode t)))

; default to text-mode
(setq-default major-mode 'text-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'amaloz-enable-flyspell)

(amaloz-global-mode t)

;; (define-key global-map (kbd "RET") 'newline-and-indent)

;; (defun kill-and-join-forward (&optional arg)
;;   (interactive "P")
;;   (if (and (eolp) (not (bolp)))
;;     (delete-indentation t)
;;     (kill-line arg)))
;; (global-set-key "\C-k" 'kill-and-join-forward)

