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
   ("C-c x o" . org-clock-out)
   ("C-c c" . org-capture))
  :config
  (setq org-todo-keywords
	'((sequence "TODO" "DOING" "|" "DONE" "CANCELLED")))
  (setq org-indent-mode t)
  (setq visual-line-mode t))

(use-package org-present)

(use-package org-bullets
  :after org
;;  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Agenda configuration
(setq org-agenda-files '("~/notes"))

;; Export configurations
(use-package ox-hugo)

(use-package ox-gfm)

(add-hook 'org-mode-hook
	  (lambda () (electric-indent-local-mode -1))
	  (lambda () (visual-line-mode t)))

(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(provide 'setup-org)

;;; setup-org.el ends here
