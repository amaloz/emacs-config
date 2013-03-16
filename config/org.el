;;; org mode
;;; 15 March 2013

;; (define-key global-map "\C-c l" 'org-store-link)
(define-key global-map "\C-c a" 'org-agenda)
(define-key global-map "\C-c b" 'org-iswitchb)

(eval-after-load "org"
  '(progn
     (setq org-agenda-files '("~/.orgfiles"))
     (setq org-todo-keywords
           '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")))
     (setq org-todo-keyword-faces
           '(("TODO" :foreground "red" :weight bold)
             ("NEXT" :foreground "blue" :weight bold)
             ("DONE" :foreground "forest green" :weight bold)))
     (setq org-use-fast-todo-selection t)

     (defun amaloz-org-mode-defaults ()
       (flyspell-mode t)
       (org-reveal))

     (setq amaloz-org-mode-hook 'amaloz-org-mode-defaults)

     (add-hook 'org-mode-hook
               (lambda ()
                 (run-hooks 'amaloz-org-mode-hook)))
     ))

(require 'org)
