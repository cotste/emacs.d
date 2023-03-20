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

  ;;; Make Org Agenda headers a bit bigger
  (set-face-attribute 'org-agenda-structure nil :height 140)
  
  ;;; Set Org heading sizes
  (set-face-attribute 'org-level-1 nil :height 1.5)
  (set-face-attribute 'org-level-2 nil :height 1.4)
  (set-face-attribute 'org-level-3 nil :height 1.3)
  (set-face-attribute 'org-level-4 nil :height 1.2)
  (set-face-attribute 'org-level-5 nil :height 1.1)

  ;;; Set table font to monospace
  (set-face-attribute 'org-table nil :family "RobotoMono Nerd Font")
  (set-face-attribute 'org-block nil :family "RobotoMono Nerd Font")

  (setq org-todo-keywords
	'((sequence "TODO" "PROG" "INTR" "|" "DONE" "CANCELLED")))


 (add-hook 'org-mode-hook(lambda ()
			    (visual-line-mode 1)
			    (electric-indent-local-mode -1)
			    (org-indent-mode t)
			    (variable-pitch-mode 1)
			    (flyspell-mode 1)
			    (org-modern-mode))))

(setq org-capture-templates
      '(("m" "Meeting" entry (file "~/notes/gtd/meetings.org")
         "* %? :MEETING: \n%^T\n")

        ("t" "Task" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? :NONE: \nDEADLINE: %^T\n")))

(use-package org-present)

(use-package org-modern)

;; (use-package org-bullets
;;   :after org
;;   :hook (org-mode . org-bullets-mode)
;;   :custom
;;   (org-bullets-bullet-list '("○" "◉" "●" "○" "●" "○" "●")))

;; Agenda configuration
(setq org-agenda-files '("~/notes/gtd"))
(setq org-agenda-window-setup 'current)

(setq org-use-tag-inheritance t)
(setq org-tags-exclude-from-inheritance '("FEATURE" "STORY" "TASK"))

(setq org-agenda-custom-commands
      '((" " "Agenda"
	 ((tags
	   "REFILE"
	   ((org-agenda-overriding-header "To Refile")))
	  (todo "")
	  (agenda "")))
	("w" "ECP Sprints"
	 ((tags-todo
	   "REFILE"
	   ((org-agenda-overriding-header "To Refile")))
	  (tags
	   "FEATURE"
	   ((org-agenda-overriding-header "Features")
	   (org-agenda-files '("~/notes/gtd/current-pi.org"))))
	  (tags-todo
	   "STORY"
	   ((org-agenda-overriding-header "Stories")
	   (org-agenda-files '("~/notes/gtd/current-pi.org"))))
	  (tags-todo
	   "TASK"
	   ((org-agenda-overriding-header "Tasks")
	   (org-agenda-files '("~/notes/gtd/current-pi.org"))))
	  (agenda "")))
	("p" "Personal"
	 ((tags
	   "PERS"
	   ((org-agenda-overriding-header "Tagged Personal")))))))



(setq org-refile-targets '((nil :maxlevel . 3)
			   (org-agenda-files :maxlevel . 3)))

;; Export configurations

;; Export locations
(defvar org-export-output-directory-prefix "export_" "Prefix of directory used for \"org-mode\" export.")

(defadvice org-export-output-file-name (before org-add-export-dir activate)
  "Modifies org-export to place exported files in a different directory."
  (when (not pub-dir)
    (setq pub-dir (concat org-export-output-directory-prefix (substring extension 1)))
    (when (not (file-directory-p pub-dir))
      (make-directory pub-dir))))

(use-package ox-hugo)

(use-package ox-gfm)

;; Org Babel
(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)
  (sql . t)))

(setq org-confirm-babel-evaluate 'cotste/confirm-babel-evaluate)


(provide 'setup-org)

;;; setup-org.el ends here
