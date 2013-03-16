
(defun amaloz/popup (title msg &optional icon)
  "Show a popup"
  (interactive)
  (shell-command (concat "notify-send "
                         (if icon (concat "-i " icon) "")
                         " '" title "' '" msg "'")))

