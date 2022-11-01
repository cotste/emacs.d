;;; Package: --- setup-org
;;; Commentary:
;;; Code:


(eval-when-compile (require 'use-package))
		   
;; Install Org - prefer built-in
(use-package org
  :straight (:type built-in)
  :bind (("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c x i" . org-clock-in)
   ("C-c x o" . org-clock-out))

  :config

  (setq org-todo-keywords
	'((sequence "TODO" "DOING" "|" "DONE" "CANCELLED")))


 (add-hook 'org-mode-hook(lambda ()
			    (visual-line-mode 1)
			    (electric-indent-local-mode -1)
			    (org-indent-mode t))))

(setq org-capture-templates
      '(("m" "Meeting" entry (file "~/notes/meetings.org")
         "* %? :MEETING: \n%^T\n")

        ("t" "Task" entry (file "~/notes/tasks.org")
         "* TODO %? :NONE: \nDEADLINE: %^T\n")))

(use-package org-present)

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

(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)))

(setq org-confirm-babel-evaluate 'cotste/confirm-babel-evaluate)


(provide 'setup-org)

;;; setup-org.el ends here
