
;; Install org-roam
(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom (org-roam-directory "~/Documents/notes")
  :bind (("C-c n f" . org-roam-node-find))
  :config
  (org-roam-db-autosync-mode))

(provide 'setup-roam)
