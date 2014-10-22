(amaloz/ensure-module-deps '(dired+ dired-single))

(setq diredp-hide-details-initially-flag nil)
(setq global-dired-hide-details-mode -1)

(after-load 'dired
			(require 'dired-single)
			(require 'dired+)
			(define-key dired-mode-map [return] 'dired-single-buffer)
			(define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
			(define-key dired-mode-map "^"
			  (function
			   (lambda nil (interactive) (dired-single-buffer "..")))))
