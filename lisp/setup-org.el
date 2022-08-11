
;; Install Org - prefer built-in
(use-package org
  :straight (:type built-in)
  :bind
  (("C-c a" . org-agenda)
   ("C-c x i" . org-clock-in)
   ("C-c x o" . org-clock-out))
  :config
  (setq org-todo-keywords
	'((sequence "TODO" "DOING" "|" "DONE" "CANCELLED"))))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))


;; Agenda configuration
(setq org-agenda-files '("~/notes"))

(provide 'setup-org)
