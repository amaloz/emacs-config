;;; amaloz mode config
;;; 15 March 2013

(defun amaloz/enable-flyspell ()
  (when (executable-find ispell-program-name)
    (flyspell-mode t)))

;; (defun amaloz/visit-term-buffer ()
;;   (interactive)
;;   (if (not (get-buffer "*ansi-term*"))
;;       (progn
;;         (split-window-sensibly (selected-window))
;;         (other-window 1)
;;         (ansi-term (getenv "SHELL")))
;;     (switch-to-buffer-other-window "*ansi-term*")))

(defvar amaloz/mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c t") 'amaloz/visit-term-buffer)
    (define-key map (kbd "C-c l") 'windmove-right)
    (define-key map (kbd "C-c h") 'windmove-left)
    (define-key map (kbd "C-c k") 'windmove-up)
    (define-key map (kbd "C-c j") 'windmove-down)
    (define-key map (kbd "C-c r") 'remember)
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
