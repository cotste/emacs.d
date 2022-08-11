;; Setup mail

(setq mu4e-mu-binary "/usr/bin/mu")

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")

(use-package mu4e
  :bind ("C-c m m" . mu4e)
  :config

  ;; Pull mu4e-org for helper functions
  (require 'mu4e-org)
  
  ;;(setq user-mail-address "stephen.cott@expeditors.com")
  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-html2text-command "w3m -T text/html" ; how to hanfle html-formatted emails
	mu4e-update-interval 300                  ; seconds between each mail retrieval
	mu4e-headers-auto-update t                ; avoid to type `g' to update
	mu4e-view-show-images t                   ; show images in the view buffer
	mu4e-compose-signature-auto-include nil   ; I don't wanta message signature
	mu4e-use-fancy-chars t)
  (setq mu4e-split-view 'vertical)
  (setq mu4e-headers-visible-columns 100)

  (setq send-mail-function 'sendmail-send-it
	sendmail-program "/usr/bin/msmtp"
;;	message-sendmail-extra-arguments '("--read-envelope-from"))
	mail-specify-envelope-from t
;;	message-sendmail-envelope-from 'header
	mail-envelope-from 'header)

  (setq mu4e-get-mail-command "mbsync -c ~/.config/mbsync/mbsyncrc -a")
  (setq mu4e-html2text-command "html2text -utf8 -nobs -width 72")

  (setq mu4e-contexts
	(list
	 (make-mu4e-context
	  :name "Work"
	  :match-func
	  (lambda (msg)
	    (when msg
	      (string-match-p "^/Work" (mu4e-message-field msg :maildir))))
	  :vars '((user-mail-address . "stephen.cott@expeditors.com")
		  (user-full-name . "Stephen Cott")
		  (mu4e-drafts-folder . "/expd/Drafts")
		  (mu4e-sent-folder . "/expd/Sent")
		  (mu4e-refile-folder . "/expd/Archive")
		  (mu4e-trash-folder . "/expd/Trash")
		  (mu4e-bookmarks . (
				     ("maildir:/expd/INBOX" "Inbox" ?i)
				     ("maildir:/expd/*" "All Mail" ?a)
				     ("date:today..now AND to:stephen.cott@expeditors.com AND maildir:/expd/*" "Today's Mail" ?t)))
		  (mu4e-compose-signature .
					  (concat
		      "Regards,\\"
		      "*Stephen Cott*\\"
		      "Senior Systems Engineer\\"
		      "IS-Core - Enterprise Core Platform\\"))))

	 (make-mu4e-context
	  :name "Fastmail"
	  :match-func
	  (lambda (msg)
	    (when msg
	      (string-match-p "^/Fastmail" (mu4e-message-field msg :maildir))))
	  :vars '((user-mail-address . "steve@stephencott.com")
		  (user-full-name . "Stephen Cott")
		  (mu4e-drafts-folder . "/fastmail/Drafts")
		  (mu4e-sent-folder . "/fastmail/Sent")
		  (mu4e-refile-folder . "/fastmail/Archive")
		  (mu4e-trash-folder . "/fastmail/Trash")
  		  (mu4e-bookmarks . (
				     ("maildir:/fastmail/INBOX" "Inbox" ?i)
				     ("maildir:/fastmail/*" "All Mail" ?a)
				     ("date:today..now AND to:steve@stephencott.com AND maildir:/fastmail/*" "Today's Mail" ?t)
				     ("date:today..now AND to:stephencott@gmail.com AND maildir:/fastmail/*" "Today's Mail(Gmail)" ?g)))))
	 
	 (make-mu4e-context
	  :name "Gmail"
	  :match-func
	  (lambda (msg)
	     (when msg
	      (string-match-p "^/Gmail" (mu4e-message-field msg :maildir))))
	  :vars '((user-mail-address . "stephencott@gmail.com")
		  (user-full-name . "Stephen Cott")
		  (mu4e-drafts-folder . "/gmail/[Gmail]/Drafts")
		  (mu4e-sent-folder . "/gmail/[Gmail]/Sent Mail")
		  (mu4e-refile-folder . "/gmail/[Gmail]/Archive")
		  (mu4e-trash-folder . "/gmail/[Gmail]/Trash")
		  (mu4e-bookmarks . (
				     ("maildir:/gmail/INBOX" "Inbox" ?i)
				     ("maildir:/gmail/*" "All Mail" ?a)
				     ("date:today..now AND to:stephencott@gmail.com AND maildir:/gmail/*" "Today's Mail" ?t))))))))

  ;; (add-to-list 'mu4e-bookmarks
  ;; 	     '(:name "Expeditors"
  ;; 	       :key ?e
  ;; 	       :query "maildir:/expd/INBOX"))

  ;; (add-to-list 'mu4e-bookmarks
  ;; 	     '(:name "Gmail"
  ;; 		     :key ?g
  ;; 		     :query "maildir:/gmail/INBOX"))

  ;; (add-to-list 'mu4e-bookmarks
  ;; 	     '(:name "Fastmail"
  ;; 		     :key ?f
  ;; 		     :query "maildir:/fastmail/INBOX")))

(setq mu4e-headers-unread-mark '("u" . "✉"))

;; Configure mu4e fonts
;;(custom-set-faces
 ;; '(mu4e-header-face ((t (:family "Noto Sans Mono"))))
 ;; '(mu4e-header-highlight-face ((t (:inherit))))
 ;; '(mu4e-unread-face ((t (:family "Noto Sans Mono"))))
 ;; '(mu4e-title-face ((t (:family "Noto Sans Mono")))))

(defun cotste/mailview ()
  (olivetti-mode)
  (olivetti-set-width 0.7))

(add-hook 'mu4e-compose-mode-hook 'cotste/mailview)
(add-hook 'mu4e-view-mode-hook 'cotste/mailview)

;; Org Mime for sending HTML emails
(use-package org-mime
  :config
  (setq org-mime-export-options '(:section-numbers nil
				  :with-author nil
				  :with-toc nil)))

;; Turn off auto-save for mail drafts to avoid filling up Drats
(add-hook 'mu4e-compose-mode-hook #'(lambda()
                                      (auto-save-mode -1)))


(provide 'setup-mail)
