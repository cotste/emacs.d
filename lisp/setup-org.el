
;; Install Org - prefer built-in
(use-package org
  :straight (:type built-in)
  :bind
  (("C-c a" . org-agenda))
  :config
  (setq org-todo-keywords
	'((sequence "TODO" "DOING" "|" "DONE" "CANCELLED"))))


;; Agenda configuration
(setq org-agenda-files '("~/Documents/notes"))

(provide 'setup-org)
