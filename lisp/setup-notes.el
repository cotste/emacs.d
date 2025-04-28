
;; Install org-roam
;; (use-package org-roam
;;   :init
;;   (setq org-roam-v2-ack t)
;;   :custom
;;   (org-roam-directory "~/notes")
;;   (org-roam-capture-templates
;;    '(("d" "default" plain
;;       "%?"
;;       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
;;       :unnarrowed t)
;;      ("m" "Music" plain
;;       "\n* ${Title} - ${Artist}\nTitle: ${title}\nArtist: %^{Artist}\nYear: %^{Year}\nPurchased: %t\n\n* Summary\n\n%?\n\n* Notes"
;;       :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: Music\n#+filetags: %^{Media Type}")
;;       :unnarrowed t)))
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n i" . org-roam-node-insert)
;;          ("C-c n d" . org-roam-dailies-capture-today)
;; 	 ("C-c n j" . org-roam-dailies-goto-today)
;;          (:map org-mode-map
;; 	       ("C-M-i" . completion-at-point)
;;                ("C-c n y" . org-roam-dailies-capture-yesterday)
;;                ("C-c n t" . org-roam-dailies-capture-tomorrow)))
;;   :config
  
;;   (require 'org-roam-dailies)

;;   (org-roam-db-autosync-mode))

;; Install and configure denote
(use-package denote
  :ensure t
  :config
  (setq denote-directory (expand-file-name "~/notes/denote"))
  (setq denote-org-front-matter
	"#+title: %s
#+date: %s
#+filetags: %s
#+identifier: %s
#+summary: %1$s
#+icon: octicons/note
#+options: ^:{}

")
  (setq denote-known-keywords '("emacs" "ecp" "devops"))
  (setq denote-dired-directories '("~/notes/denote" "~/notes/denote/daily" "~/notes/denote/blog" "~/notes/denote/expd"))
  (setq denote-silo-extras-directories '("~/notes/denote" "~/notes/denote/daily" "~/notes/denote/blog" "~/notes/denote/expd"))

	(setq denote-link-backlinks-display-buffer-action
          (quote ((display-buffer-reuse-window
                   display-buffer-in-side-window)
                  (side . right)
                  (slot . 99)
                  (window-width . 0.3)))))

(add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
(add-hook 'denote-dired-mode-hook #'dired-hide-details-mode)

(setq denote-templates
      `((briefing . sjc-briefing-note-template)))

(defun sjc-briefing-note-template ()
  (interactive)
  (with-temp-buffer
    (insert-file-contents "~/briefing_note.template")
    (buffer-substring-no-properties
       (point-min)
       (point-max))))

;;(require 'notes-list)
;;(setq notes-list-directories '("~/notes/denote/"))


(provide 'setup-notes)

;;; setup-notes.el ends here
