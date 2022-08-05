
;; Install org-roam
(use-package org-roam
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Documents/notes")
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))

  :bind (("C-c n f" . org-roam-node-find))
  :config
  (org-roam-db-autosync-mode))

(provide 'setup-roam)
