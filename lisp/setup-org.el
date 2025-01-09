;;; Package: --- setup-org
;;; Commentary:
;;; Code:


(eval-when-compile (require 'use-package))
		   
;; Install Org - prefer built-in
(use-package org
  :ensure nil
  :bind (("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c x i" . org-clock-in)
   ("C-c x o" . org-clock-out))

  :config

  ;;; Make Org Agenda headers a bit bigger
;;  (set-face-attribute 'org-agenda-structure nil :height 140)
  
  ;;; End of org-mode use-package


  (setq org-hide-emphasis-markers t
				org-ellipsis "..."
				org-pretty-entities t
				org-todo-keywords
	      '((sequence "TODO(t)" "PROG(p)" "INTR(i)" "|" "DONE(d)" "CANCELLED(c!)"))
				;;org-log-into-drawer "LOGBOOK"
				org-use-fast-todo-selection t
				org-startup-with-inline-images t))


 (add-hook 'org-mode-hook(lambda ()
			    (visual-line-mode 0)
			    (variable-pitch-mode 1)
;;			    (auto-fill-mode 1)
			    (flyspell-mode 1)
			    (org-modern-mode)
			    (zuco/org-hook-fonts)))



(setq org-capture-templates
      '(("m" "Meeting" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? :MEETING: \nSCHEDULED: %^T\n:properties:\n:taxonomy: %^{Taxonomy}\n:end:\n")

        ("g" "TODO" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? \nDEADLINE: %^T\n:properties:\n:taxonomy: %^{Taxonomy}\n:type: %^{Type e.g. Meeting, Research}\n:end:\n")
	("f" "Feature" entry (file "~/notes/gtd/inbox.org")
         "* %? \nDEADLINE: %^T\n:properties:\n:taxonomy: Iteration\n:type Feature\n:end:\n")
	("s" "Story" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? \nDEADLINE: %^T\n:properties:\n:taxonomy: Sprint\n:type: Story\n:end:\n")
	("t" "Task" entry (file "~/notes/gtd/inbox.org")
         "* TODO %? :task: \nDEADLINE: %^T\n:properties:\n:taxonomy Sprint\n:type Task\n:end:\n")))

(use-package org-present :ensure t)

(use-package org-modern :ensure t)

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
				"~/notes/gtd/general.org"
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
		 "type={General}"
		 ((org-agenda-overriding-header "General")
		  (org-agenda-files '("~/notes/gtd/general.org"
                              "~/notes/gtd/current-pi.org"))))
        (tags-todo
		 "taxonomy={architecture}"
		 ((org-agenda-overriding-header "Architecture")
		  (org-agenda-files '("~/notes/gtd/current-pi.org"))))
	  (tags
	   "type={feature}"
	   ((org-agenda-overriding-header "Features")
			(org-agenda-files '("~/notes/gtd/current-pi.org"))))
	  (tags-todo
	   "type={story}"
	   ((org-agenda-overriding-header "Stories")
			(org-agenda-files '("~/notes/gtd/current-pi.org"))))
	  (tags-todo
	   "type={task}"
	   ((org-agenda-overriding-header "Tasks")
			(org-agenda-files '("~/notes/gtd/current-pi.org"))))
	  (agenda "")))
	("p" "Personal"
	 ((tags
	   "taxonomy={Personal}"
	   ((org-agenda-overriding-header "Tagged Personal")))))))

;; Org Refile Targets
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

;; Export org to a nice looking PDF file
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("org-notes"
                 "\\documentclass[12pt]{article}
                  [NO-DEFAULT-PACKAGES]
                  [EXTRA]
                  \\input{/home/chq-stephenco/.emacs.d/.local/custom-org-latex-classes/notes-setup-file.tex}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq org-latex-compiler "xelatex")

(use-package ox-hugo :ensure t)

(use-package ox-pandoc :ensure t)

(use-package ox-gfm :ensure t)

;; Org Babel
(org-babel-do-load-languages
'org-babel-load-languages
'((shell . t)
  (sql . t)
  (python . t)))

(setq org-confirm-babel-evaluate 'cotste/confirm-babel-evaluate)


(provide 'setup-org)

;;; setup-org.el ends here
