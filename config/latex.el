;; LaTeX config
;; 02 March 2013

(amaloz-ensure-module-deps '(auctex))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(setq reftex-plug-into-auctex t)

(setq TeX-view-program-list
      '(("PDF Viewer" "mupdf %o")))

(defun amaloz-latex-mode-defaults ()
  (turn-on-auto-fill)
  (turn-on-reftex)
  (abbrev-mode t))

(setq amaloz-latex-mode-hook 'amaloz-latex-mode-defaults)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (run-hooks 'amaloz-latex-mode-hook)))
