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
;;  (set-face-attribute 'org-agenda-structure nil :height 140)
  
  ;;; Set Org heading sizes
  (set-face-attribute 'org-level-1 nil :height 1.4)
  (set-face-attribute 'org-level-2 nil :height 1.3)
  (set-face-attribute 'org-level-3 nil :height 1.2)
  (set-face-attribute 'org-level-4 nil :height 1.1)
  (set-face-attribute 'org-level-5 nil :height 1.0)

  ;;; Set table font to monospace
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
	(set-face-attribute 'org-hide nil :inherit 'fixed-pitch)

  (setq org-hide-emphasis-markers t
				org-ellipsis "..."
				org-pretty-entities t
				org-todo-keywords
	      '((sequence "TODO(t)" "PROG(p)" "INTR(i)" "|" "DONE(d)" "CANCELLED(c!)"))
				;;org-log-into-drawer "LOGBOOK"
				org-use-fast-todo-selection t
				org-startup-with-inline-images t)


 (add-hook 'org-mode-hook(lambda ()
			    (visual-line-mode 0)
			    (variable-pitch-mode 1)
			    (auto-fill-mode 1)
			    (flyspell-mode 1)
			    (org-modern-mode))))

;;; End of org-mode use-package



(setq org-capture-templates
      '(("m" "Meeting" entry (file "~/notes/gtd/meetings.org")
         "* TODO %? :MEETING: \nSCHEDULED: %^T\n")

        ("g" "TODO" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? :NONE: \nDEADLINE: %^T\n")
	("f" "Feature" entry (file "~/notes/gtd/inbox.org")
         "* %? :feature: \nDEADLINE: %^T\n")
	("s" "Story" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? :story: \nDEADLINE: %^T\n")
	("t" "Task" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? :task: \nDEADLINE: %^T\n")))

(use-package org-present)

(use-package org-modern)

;; Agenda configuration
(setq org-agenda-files '("~/notes/gtd"))
(setq org-agenda-window-setup 'current)

(setq org-use-tag-inheritance t)
(setq org-tags-exclude-from-inheritance '("feature" "story" "task"))

(setq org-agenda-custom-commands
      '((" " "Agenda"
	 ((tags
	   "REFILE"
	   ((org-agenda-overriding-header "To Refile")))
	  (todo "")
	  (agenda "")))
	("p" "Personal"
	 ((tags-todo
	   "REFILE"
	   ((org-agenda-overriding-header "To Refile")))
	  (todo
	   ""
	   ((org-agenda-overriding-header "Personal TODOs")
	    (org-agenda-files '("~/notes/gtd/personal.org"))))))
	("w" "ECP Sprints"
	 ((tags-todo
	   "REFILE"
	   ((org-agenda-overriding-header "To Refile")))
	  (agenda
	   ""
	   ((org-agenda-overriding-header "Due Today")
	    (org-agenda-files '("~/notes/gtd/ecp.org"
				"~/notes/gtd/current-pi.org"
				"~/notes/gtd/meetings.org"
				"~/notes/gtd/mundality.org"
				"~/notes/gtd/core-systems.org"))
	    (org-agenda-span 'day)
	    (org-agenda-time-grid nil)
	    (org-agenda-entry-types '(:deadline))
	    (org-deadline-warning-days 0)
	    (org-agenda-show-all-dates nil)))
 	  (agenda
	   ""
	   ((org-agenda-overriding-header "Today's Meetings")
	    (org-agenda-span 'day)
	    (org-agenda-time-grid nil)
	    (org-agenda-entry-types '(:scheduled))
	    (org-deadline-warning-days 0)
	    (org-agenda-show-all-dates nil)))
	  (tags
	   "feature"
	   ((org-agenda-overriding-header "Features")
			(org-agenda-files '("~/notes/gtd/current-pi.org"
													"~/notes/gtd/core-systems.org"))))
	  (tags-todo
	   "story"
	   ((org-agenda-overriding-header "Stories")
			(org-agenda-files '("~/notes/gtd/current-pi.org"
													"~/notes/gtd/core-systems.org"))))
	  (tags-todo
	   "task"
	   ((org-agenda-overriding-header "Tasks")
			(org-agenda-files '("~/notes/gtd/current-pi.org"
													"~/notes/gtd/core-systems.org"))))
	  (agenda "")))
	("p" "Personal"
	 ((tags
	   "PERS"
	   ((org-agenda-overriding-header "Tagged Personal")))))))



(setq org-refile-targets '((nil :maxlevel . 3)
			   (org-agenda-files :maxlevel . 3)))

;; Export configurations

;; Export locations
(defvar org-export-output-directory-prefix "~/exports/export_" "Prefix of directory used for \"org-mode\" export.")

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
