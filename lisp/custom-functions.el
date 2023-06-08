;;; Package -- custom-functions.el
;;; Commentary:

;;; Code:

;; Check if host is chaos

(defvar cotste-light-theme 'doom-gruvbox-light)
(defvar cotste-dark-theme 'doom-gruvbox)
(defvar cotste-current-theme "light")

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


(provide 'custom-functions)

;;; custom-functions.el ends here
