
(load-file "/home/amaloz/prog/easycrypt/proofgeneral/_local/ProofGeneral-4.2/generic/proof-site.el")
;; (load-file "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

(defun amaloz/coq-mode-defaults ()
  (setq coq-compile-before-require t)
  )

(setq amaloz/coq-mode-hook 'amaloz/coq-mode-defaults)

(add-hook 'coq-mode-hook
          (lambda ()
            (run-hooks 'amaloz/coq-mode-hook)))
