
;; Install org-roam
(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/notes")
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("m" "Music" plain
      "\n* ${Title} - ${Artist}\nTitle: ${title}\nArtist: %^{Artist}\nYear: %^{Year}\nPurchased: %t\n\n* Summary\n\n%?\n\n* Notes"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+category: Music\n#+filetags: %^{Media Type}")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n d" . org-roam-dailies-capture-today)
	 ("C-c n j" . org-roam-dailies-goto-today)
         (:map org-mode-map
	       ("C-M-i" . completion-at-point)
               ("C-c n y" . org-roam-dailies-capture-yesterday)
               ("C-c n t" . org-roam-dailies-capture-tomorrow)))
  :config
  
  (require 'org-roam-dailies)

  (org-roam-db-autosync-mode))

;; Install and configure denote
(use-package denote
  :config
  (setq denote-directory (expand-file-name "~/notes/denote"))
  (setq denote-known-keywords '("emacs" "ecp" "devops"))
  :bind
  (("C-c n n" . denote-create-note)
   ("C-c n N" . denote-type)
   ("C-c n r" . denote-rename-file)))

(provide 'setup-notes)

;;; setup-notes.el ends here
