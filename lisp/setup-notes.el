
;; Install and configure denote
(use-package denote
  :ensure t
  :config
  (setq denote-directory (expand-file-name "~/notes"))
  (setq denote-org-front-matter
	"#+title: %s
#+date: %s
#+filetags: %s
#+identifier: %s
#+summary: %1$s
#+icon: octicons/note
#+options: ^:{}

")
  (setq denote-known-keywords '("emacs"))
  (setq denote-dired-directories '("~/notes/" "~/notes/expd/denote"))
  (setq denote-silo-directories '("~/notes"))

	(setq denote-link-backlinks-display-buffer-action
          (quote ((display-buffer-reuse-window
                   display-buffer-in-side-window)
                  (side . right)
                  (slot . 99)
                  (window-width . 0.3)))))

(use-package denote-silo
  :ensure (:host github :repo "protesilaos/denote-silo"))

(add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
(add-hook 'denote-dired-mode-hook #'dired-hide-details-mode)

(setq denote-templates
      `((briefing . sjc-briefing-note-template)))

(defun sjc-briefing-note-template ()
  (interactive)
  (with-temp-buffer
    (insert-file-contents "~/briefing_note.template")
    (buffer-substring-no-properties
       (point-min)
       (point-max))))

(defvar denote-project-list)

(defun denote-project-open-or-create ()
  (interactive
   (list (completing-read "Select a project: " denote-project-list nil t))))


  

(provide 'setup-notes)

;;; setup-notes.el ends here
