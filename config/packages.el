
(require 'package)
(add-to-list 'package-archives
    '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

; make sure dash is installed before proceeding
(if (not (package-installed-p 'dash))
    (package-install 'dash))
(require 'dash)

(defvar amaloz/packages
  '(flycheck flymake zenburn-theme)
  "packages required at launch.")

(defun amaloz/packages-installed-p ()
  (-all? #'package-installed-p amaloz/packages))

(defun amaloz/install-packages ()
  (unless (amaloz/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (-each
     (-reject #'package-installed-p amaloz/packages)
     #'package-install)))

(defun amaloz/ensure-module-deps (packages)
  (-each (-remove #'package-installed-p packages) #'package-install))

(amaloz/install-packages)
