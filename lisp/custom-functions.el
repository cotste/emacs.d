;;; Package -- custom-functions.el
;;; Commentary:

;;; Code:

;; Check if host is chaos

(defvar cotste-light-theme 'doom-tomorrow-day)
(defvar cotste-dark-theme 'doom-tomorrow-night)
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

(provide 'custom-functions)

;;; custom-functions.el ends here
