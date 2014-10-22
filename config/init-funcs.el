
;; from http://emacsredux.com/blog/2013/03/27/copy-filename-to-the-clipboard/
(defun amaloz/copy-file-name-to-clipboard ()
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to clipboard" filename))))

;; adapted from http://emacsredux.com/blog/2013/03/28/google/
(defun amaloz/duckduckgo ()
  (interactive)
  (browse-url
   (concat
    "https://duckduckgo.com/?q="
    (url-hexify-string
     (if mark-active (buffer-substring (region-beginning) (region-end))
       (read-string "DuckDuckGo: "))))))

(defun amaloz/enable-flyspell ()
  (when (executable-find ispell-program-name)
    (flyspell-mode t)))

;; from http://emacsredux.com/blog/2013/03/30/kill-other-buffers/
(defun amaloz/kill-other-buffers ()
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (equal buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

;; from http://emacsredux.com/blog/2013/03/27/open-file-in-external-program/
(defun amaloz/open-file-name-with ()
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (read-shell-command "Open current file with: ")
                    " "
                    buffer-file-name))))

(defun amaloz/popup (title msg &optional icon)
  "Show a popup"
  (interactive)
  (shell-command (concat "notify-send "
                         (if icon (concat "-i " icon) "")
                         " '" title "' '" msg "'")))

;; from http://emacsredux.com/blog/2013/03/26/smarter-open-line/
(defun amaloz/smart-open-line ()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

;; from http://emacsredux.com/blog/2013/03/29/terminal-at-your-fingertips/
(defun amaloz/visit-term-buffer ()
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))
