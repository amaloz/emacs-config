
;; Stolen from https://github.com/mikulely/emacs.d/blob/master/init-utils.el
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
	 '(progn ,@body)))
