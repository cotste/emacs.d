;;; Package: --- setup-org.el
;;; Commentary:

;;; Code:

(eval-when-compile (require 'use-package))
		   
;; Install Org - prefer built-in
(use-package org
  :straight (:type built-in)
  :bind
  (("C-c a" . org-agenda)
   ("C-c x i" . org-clock-in)
   ("C-c x o" . org-clock-out))
  :config
  (setq org-todo-keywords
	'((sequence "TODO" "DOING" "|" "DONE" "CANCELLED")))
  (setq org-indent-mode t)
  (setq visual-line-mode t))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Agenda configuration
(setq org-agenda-files '("~/notes"))

;; Export configurations
(use-package ox-hugo)

(use-package ox-gfm)

(provide 'setup-org)

;;; setup-org.el ends here
