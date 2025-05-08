
;; Install and configure denote
(use-package denote
  :ensure t
  :config
  (setq denote-directory (expand-file-name "~/notes/denote"))
  (setq denote-org-front-matter
	"#+title: %s
#+date: %s
#+filetags: %s
#+identifier: %s
#+summary: %1$s
#+icon: octicons/note
#+options: ^:{}

")
  (setq denote-known-keywords '("emacs" "ecp" "devops"))
  (setq denote-dired-directories '("~/notes/denote" "~/notes/denote/daily" "~/notes/denote/blog" "~/notes/expd"))
  (setq denote-silo-extras-directories '("~/notes/denote" "~/notes/denote/daily" "~/notes/denote/blog" "~/notes/expd"))

	(setq denote-link-backlinks-display-buffer-action
          (quote ((display-buffer-reuse-window
                   display-buffer-in-side-window)
                  (side . right)
                  (slot . 99)
                  (window-width . 0.3)))))

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

;;(require 'notes-list)
;;(setq notes-list-directories '("~/notes/denote/"))


(provide 'setup-notes)

;;; setup-notes.el ends here
