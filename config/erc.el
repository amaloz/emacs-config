;;; erc configuration
;;; 12 March 2013

(require 'tls)
(setq tls-program '("gnutls-cli --starttls -p %p %h"))

;;; Note: need to define private-erc-nick, private-erc-user-full-name,
;;; private-erc-user-information, and private-erc-system-name.
(eval-after-load "erc"
  '(progn
     (if (boundp 'private-erc-nick)
         (setq erc-nick private-erc-nick))
     (if (boundp 'private-erc-user-full-name)
         (setq erc-user-full-name private-erc-user-full-name))
     (if (boundp 'private-erc-user-information)
         (setq erc-user-information private-erc-user-information))
     (if (boundp 'private-erc-system-name)
         (setq erc-system-name private-erc-system-name))
     (setq erc-default-server "irc.freenode.net")
     (setq erc-default-port "7000")
     (setq erc-anonymous-login t)
     (setq erc-auto-query 'window-noselect)
     (setq erc-modules '(autojoin button completion fill irccontrols keep-place
                                  list log match menu move-to-prompt netsplit networks
                                  noncommands readonly ring services spelling stamp
                                  track truncate))
     ;; (erc-update-modules)
     (erc-notify-mode t)
     (erc-autojoin-mode t)
     (erc-services-mode 1)
     (erc-spelling-mode 1)

     (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"
                                     "301" ; away notice
                                     "305" ; return from awayness
                                     "306" ; set awayness
                                     "324" ; modes
                                     "329" ; channel creation date
                                     "332" ; topic notice
                                     "333" ; who set the topic
                                     "353" ; names notice
                                     ))
     ;; (setq erc-hide-list '("JOIN" "NICK" "PART" "QUIT"))
     (setq erc-track-showcount t
           erc-track-shorten-start 4
           erc-track-switch-diretion 'importance
           erc-track-visibility 'selected-visible)
     (erc-track-mode 1)
     (setq erc-server-reconnect-attempts 4
           erc-server-reconnect-timeout 5)
     (setq erc-keywords nil)
     ))

;; from http://emacs-fu.blogspot.com/2009/06/erc-emacs-irc-client.html
;; (defun amaloz-erc-start-or-switch ()
;;   "Connect to ERC, or switch to last active buffer"
;;   (interactive)
;;   (if (get-buffer "irc.freenode.net:7000")
;;       (erc-track-switch-buffer 1)
;;     (when (y-or-n-p "Start ERC? ")
;;       (erc-tls))))
;; (global-set-key (kbd "C-c C-e") 'amaloz-erc-start-or-switch)
