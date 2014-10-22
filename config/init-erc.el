;;; erc configuration
;;; 12 March 2013

(require 'tls)
(setq tls-program '("gnutls-cli --starttls -p %p %h"))

;;
;; Note: need to define the following variables:
;;
;;   private-erc-nick
;;   private-erc-user-full-name
;;   private-erc-user-information
;;   private-erc-system-name
;;   private-erc-default-server
;;   private-erc-default-port
;;   private-erc-rooms
;;
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
     (if (boundp 'private-erc-default-server)
         (setq erc-default-server private-erc-default-server))
     (if (boundp 'private-erc-default-port)
         (setq erc-default-port private-erc-default-port))
     (setq erc-anonymous-login t)
     (setq erc-auto-query 'window-noselect)
     (setq erc-modules '(autojoin button completion fill irccontrols keep-place
                                  list match menu move-to-prompt netsplit
                                  networks noncommands notify readonly ring
                                  services spelling stamp track truncate))

     (if (boundp 'private-erc-rooms)
         (setq erc-autojoin-channels-alist private-erc-rooms))
     
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
     (setq erc-hide-list '("JOIN" "NICK" "PART" "QUIT"))
     (setq erc-track-showcount t
           erc-track-shorten-start 4
           erc-track-switch-diretion 'importance
           erc-track-visibility 'selected-visible)

     (setq erc-server-reconnect-attempts 4
           erc-server-reconnect-timeout 5)
     (setq erc-keywords nil)
     ))

(defun amaloz/start-irc ()
  "Start IRC using configured parameters"
  (interactive)
  (erc-tls :server erc-default-server
           :port erc-default-port
           :nick erc-nick
           :full-name erc-user-full-name))

(if (and (boundp 'private-erc-default-server) (boundp 'private-erc-default-port))
    ;; modified from http://emacs-fu.blogspot.com/2009/06/erc-emacs-irc-client.html
    (defun amaloz/erc-start-or-switch ()
      "Connect to ERC, or switch to last active buffer"
      (interactive)
      (if (get-buffer
           (concat private-erc-default-server ":" private-erc-default-port))
          (erc-track-switch-buffer 1)
        (when (y-or-n-p "Start ERC? ")
          (amaloz/start-irc)))))

(if (fboundp 'amaloz/erc-start-or-switch)
    (define-key global-map (kbd "C-c e") 'amaloz/erc-start-or-switch))
