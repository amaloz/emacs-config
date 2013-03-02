
(require 'package)
(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(require 'dash)

(defvar amaloz-packages
  '(flycheck zenburn-theme)
  "packages required at launch.")

(defun amaloz-packages-installed-p ()
  (-all? #'package-installed-p amaloz-packages))

(defun amaloz-install-packages ()
  (unless (amaloz-packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (-each
     (-reject #'package-installed-p amaloz-packages)
     #'package-install)))

(amaloz-install-packages)
