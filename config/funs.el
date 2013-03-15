
(defun amaloz/enable-flyspell ()
  (when (executable-find ispell-program-name)
    (flyspell-mode t)))

(defun amaloz/visit-term-buffer ()
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

