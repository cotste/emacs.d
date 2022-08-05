;; Setup mail

(setq mu4e-mu-binary "/usr/bin/mu")

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")

    (use-package mu4e
      :bind ("C-c m m" . mu4e)
      :config
      (setq user-mail-address "stephen.cott@expeditors.com")
      (setq mu4e-change-filenames-when-moving t)
      (setq mu4e-update-interval (* 10 60))
      (setq mu4e-html2text-command "w3m -T text/html" ; how to hanfle html-formatted emails
            mu4e-update-interval 300                  ; seconds between each mail retrieval
            mu4e-headers-auto-update t                ; avoid to type `g' to update
            mu4e-view-show-images t                   ; show images in the view buffer
            mu4e-compose-signature-auto-include nil   ; I don't wanta message signature
            mu4e-use-fancy-chars t)

      (setq send-mail-function 'sendmail-send-it
            sendmail-program "/usr/bin/msmtp"
            mail-specify-envelope-from t
            message-sendmail-envelope-from 'header
            mail-envelope-from 'header)

      (setq mu4e-get-mail-command "mbsync -a")
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
                      (mu4e-compose-signature .
					      (concat
                          "Regards,\\"
                          "*Stephen Cott*\\"
                          "Senior Systems Engineer\\"
                          "IS-Core - Enterprise Core Platform\\"))))

             (make-mu4e-context
              :name "Proton"
              :match-func
              (lambda (msg)
                (when msg
                  (string-match-p "^/Proton" (mu4e-message-field msg :maildir))))
              :vars '((user-mail-address . "stephencott@pm.me")
                      (user-full-name . "Stephen Cott")
                      (mu4e-drafts-folder . "/proton/Drafts")
                      (mu4e-sent-folder . "/proton/Sent")
                      (mu4e-refile-folder . "/proton/Archive")
                      (mu4e-trash-folder . "/proton/Trash")))
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
                      (mu4e-trash-folder . "/gmail/[Gmail]/Trash")))))

      (add-to-list 'mu4e-bookmarks
                 '(:name "Expeditors"
                   :key ?e
                   :query "maildir:/expd/INBOX"))

      (add-to-list 'mu4e-bookmarks
                 '(:name "Gmail"
                         :key ?g
                         :query "maildir:/gmail/INBOX"))

      (add-to-list 'mu4e-bookmarks
                 '(:name "Proton"
                         :key ?p
                         :query "maildir:/proton/INBOX")))

(setq mu4e-headers-unread-mark '("u" . "✉"))

(defun cotste/mailview ()
  (olivetti-set-width 0.5)
  (olivetti-mode))

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
