
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
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n d" . org-roam-dailies-capture-today)
         (:map org-mode-map
	       ("C-M-i" . completion-at-point)
               ("C-c n y" . org-roam-dailies-capture-yesterday)
               ("C-c n t" . org-roam-dailies-capture-tomorrow)
               ("C-c n c" . org-roam-dailies-goto-today)))
  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

(provide 'setup-roam)
