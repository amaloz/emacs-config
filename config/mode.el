;;; amaloz mode config
;;; 15 March 2013

(amaloz/ensure-module-deps '(iy-go-to-char))
(require 'iy-go-to-char)

(defvar amaloz/mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c s") 'amaloz/duckduckgo)
    (define-key map (kbd "C-c t") 'amaloz/visit-term-buffer)

    (define-key map (kbd "C-c m") 'helm-mini)
    ;; (define-key map (kbd "C-x C-f") 'helm-find-files)

    (define-key map (kbd "C-c l") 'windmove-right)
    (define-key map (kbd "C-c h") 'windmove-left)
    (define-key map (kbd "C-c k") 'windmove-up)
    (define-key map (kbd "C-c j") 'windmove-down)

    (define-key map (kbd "C-c r") 'remember)
    (define-key map (kbd "C-c f") 'iy-go-to-char)
    (define-key map (kbd "C-c F") 'iy-go-to-char-backward)
    (define-key map (kbd "C-c ;") 'iy-go-to-char-continue)
    (define-key map (kbd "C-c ,") 'iy-go-to-char-continue-backward)
    (define-key map (kbd "C-c C") 'hide/show-comments-toggle)

    (define-key map (kbd "M 1") 'shell-command)
    map)
  "")

(define-globalized-minor-mode amaloz/global-mode amaloz/mode amaloz/on)

(defun amaloz/on () (amaloz/mode +1))
(defun amaloz/off () (amaloz/mode -1))

(define-minor-mode amaloz/mode
  "amaloz's minor mode.

\\{amaloz/mode-map}"
  :lighter " amaloz"
  :keymap amaloz/mode-map)
