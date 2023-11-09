;;; Package -- custom-functions.el
;;; Commentary:

;;; Code:

(defvar cotste-light-theme 'modus-operandi)
(defvar cotste-dark-theme 'modus-vivendi)
(defvar cotste-current-theme "light")

;; Check if host is chaos
(defun host-is-chaos ()
  "Return non-nil if hostname is chaos."
  (string-equal (system-name) "chaos"))

(defun host-is-devo ()
  "Return non-nil if hostname is devo."
  (string-equal (system-name) "devo"))

(defun host-is-pan ()
  "Return non-nil if hostname is pan."
  (string-equal (system-name) "pan"))

(defun host-is-moros ()
  "Return non-nil if hostname is moros - Fedora 37 at work."
  (string-equal (system-name) "moros"))

(defun zuco-light-theme ()
	(interactive)
	(setq cotste-current-theme "light")
	;;(load-theme 'modus-operandi t))
  (setq catppuccin-flavor 'latte)
  (load-theme 'catppuccin t))

(defun zuco-dark-theme ()
	(interactive)
	(setq cotste-current-theme "dark")
	;;(load-theme 'modus-vivendi t))
  (setq catppuccin-flavor 'macchiato)
  (load-theme 'catppuccin t))

(defun cotste-theme-switch ()
  "Disable current theme and prompt for new theme."
  (interactive)
  (cond
   ((string-equal cotste-current-theme "light")
    (disable-theme (car custom-enabled-themes))
    (load-theme cotste-dark-theme t)
    (setq cotste-current-theme "dark"))
   ((string-equal cotste-current-theme "dark")
    (disable-theme (car custom-enabled-themes))
    (load-theme cotste-light-theme t)
    (setq cotste-current-theme "light"))))

(defun cotste/confirm-babel-evaluate (lang body)
  "Add languages to babel evaluate for no confirm."
  (not (member lang '("C" "sh" "shell"))))

(defun cotste/auto-push ()
    "Turn on auto push and auto add files."
  (setq gac-automatically-push-p t)
  (setq gac-automatically-add-new-files-p t))

(defun cotste/browse-url-with-eww ()
  "Browse the url at point with eww."
  (interactive)
  (eww-browse-url (thing-at-point-url-at-point)))

(defun cotste/browse-url-with-gui ()
  "Browse the url at point with the defaul GUI browser."
  (interactive)
  (browse-url (thing-at-point-url-at-point)))

(defun cotste/browse-safelink-url ()
  "Browse a safelink URL at point with GUI browser."
  (interactive)
  
  ;;;(browse-url (cotste/decode-safelink(thing-at-point-url-at-point))))
  (message (thing-at-point-url-at-point)))

(require 'url-parse)
(defun cotste/decode-safelink (url)
  "Given a url string this function returns the corresponding decoded url."
      (let* ((query (url-filename (url-generic-parse-url url)))
             (url (cadr (assoc ".*/?url" (url-parse-query-string query) (lambda (pat x) (string-match-p x pat)))))
             (path (replace-regexp-in-string "3Dhttps" "https" (url-unhex-string url))))
        (url-encode-url (replace-regexp-in-string (rx "/" (>= 20 (any "#$%&*^@"))) "" path)))
      url)

(defvar sjc-denote-silos
  '("~/notes/denote"
    "~/notes/denote/daily"
    "~/notes/denote/blog"))

(defvar sjc-denote-silo-commands
  '(denote
    denote-template))

(defun sjc-select-denote-silo (silo command)
  "Select a SILO and the COMMAND to run in that silo."
  (interactive
   (list (completing-read "Select a silo: " sjc-denote-silos nil t)
	 (intern (completing-read "Run command in silo: "
				  sjc-denote-silo-commands nil t))))
   (let ((denote-directory silo))
     (call-interactively command)))

(defun sjc-denote-regex-search ()
  (interactive
  (let ((default-directory "~/notes/denote"))
    (project-find-regexp (read-regexp "Notes search (regex): ")))))

(defun sjc/list-diary-notes ()
  (interactive
   (let ((default-directory "~/notes/denote/daily")
	 (notes-list-directories '("~/notes/denote/daily/")))
     (notes-list))))

(defun sjc/new-diary-note ()
  "Create a diary entry tagged 'journal'."
  (interactive
   (let ((default-directory "~/notes/denote/daily")
	 (denote-directory "~/notes/denote/daily"))
	 (denote
	  (format-time-string "%A %e %B %Y")
	  '("journal")))))

;;; Org Mode Hooks

(defun zuco/org-hook-fonts ()


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
  (set-face-attribute 'org-hide nil :inherit 'fixed-pitch))


(provide 'custom-functions)

;;; custom-functions.el ends here
