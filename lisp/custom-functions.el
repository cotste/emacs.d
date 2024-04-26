;;; Package -- custom-functions.el
;;; Commentary:

;;; Code:

(defun my-mode-hooks ()
  (add-hook 'prog-mode-hook            #'my-prog-mode-hook)
  (add-hook 'text-mode-hook            #'my-text-mode-hook)
  (add-hook 'org-mode-hook             #'my-org-mode-hook)
  (add-hook 'magit-mode-hook           #'my-magit-mode-hook)
  (add-hook 'pdf-view-mode-hook        #'nano-modeline-pdf-mode)
  (add-hook 'mu4e-headers-mode-hook    #'nano-modeline-mu4e-headers-mode)
  (add-hook 'mu4e-view-mode-hook       #'nano-modeline-mu4e-message-mode)
  (add-hook 'elfeed-show-mode-hook     #'nano-modeline-elfeed-entry-mode)
  (add-hook 'elfeed-search-mode-hook   #'nano-modeline-elfeed-search-mode)
  (add-hook 'term-mode-hook            #'my-term-mode-hook)
  (add-hook 'vterm-mode-hook           #'my-vterm-mode-hook)
  (add-hook 'xwidget-webkit-mode-hook  #'nano-modeline-xwidget-mode)
  (add-hook 'messages-buffer-mode-hook #'nano-modeline-message-mode)
  (add-hook 'org-capture-mode-hook     #'nano-modeline-org-capture-mode)
  (add-hook 'org-agenda-mode-hook      #'nano-modeline-org-agenda-mode)
  (add-hook 'dired-mode-hook           #'my-dired-mode-hook))

(defun my-prog-mode-hook ()
  (add-hook 'prog-mode-hook            #'nano-modeline-prog-mode)
  (setq mode-line-format nil))

(defun my-org-mode-hook ()
  (add-hook 'org-mode-hook            #'nano-modeline-org-mode)
  (setq mode-line-format nil))

(defun my-text-mode-hook ()
  (add-hook 'text-mode-hook            #'nano-modeline-text-mode)
  (setq mode-line-format nil))

(defun my-term-mode-hook ()
  (add-hook 'term-mode-hook            #'nano-modeline-term-mode)
  (setq mode-line-format nil))

(defun my-vterm-mode-hook ()
  (add-hook 'vterm-mode-hook            #'nano-modeline-term-mode)
  (setq mode-line-format nil))

(defun my-magit-mode-hook ()
  (add-hook 'magit-mode-hook            #'nano-modeline-text-mode)
  (setq mode-line-format nil))

(defun my-dired-mode-hook ()
  (setq mode-line-format nil))

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
  "Switch to the light version of a theme."
	(interactive)
	(setq zuco-current-theme "light")
  (setq catppuccin-flavor 'latte)
  (disable-theme 'catppuccin)
  (load-theme 'catppuccin t))

(defun cotste-light-theme ()
  "Switch to the light version of a theme."
	(interactive)
	(setq cotste-current-theme "light")
  (disable-theme 'modus-vivendi)
  (load-theme 'modus-operandi t))

(defun zuco-dark-theme ()
  "Switch to the dark version of a theme."
	(interactive)
	(setq zuco-current-theme "dark")
  (setq catppuccin-flavor 'frappe)
  (disable-theme 'catppuccin)
  (load-theme 'catppuccin t))

(defun cotste-dark-theme ()
  "Switch to the dark version of a theme."
	(interactive)
	(setq cotste-current-theme "dark")
  (disable-theme 'modus-operandi)
  (load-theme 'modus-vivendi t))

(defun zuco-switch-theme ()
  "Swap between light and dark themes."
  (interactive)
  (cond
   ((string-equal zuco-current-theme "light")
    (zuco-dark-theme))
   ((string-equal zuco-current-theme "dark")
    (zuco-light-theme))))

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
  "Add LANG to babel evaluate for no confirm in BODY."
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
  "Given a URL string this function returns the corresponding decoded url."
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
  "Create a diary entry tagged \=journal\=."
  (interactive
   (let ((default-directory "~/notes/denote/daily")
	 (denote-directory "~/notes/denote/daily"))
	 (denote
	  (format-time-string "%A %e %B %Y")
	  '("journal")))))

;;; Org Mode Hooks

(defun zuco/org-hook-fonts ()


  ;;; Set Org heading sizes

  (set-face-attribute 'org-level-1 nil :family "Jost" :height 1.4)
  (set-face-attribute 'org-level-2 nil :family "Jost" :height 1.3)
  (set-face-attribute 'org-level-3 nil :family "Jost" :height 1.2)
  (set-face-attribute 'org-level-4 nil :family "Jost" :height 1.1)
  (set-face-attribute 'org-level-5 nil :family "Jost" :height 1.0)

  ;;; Set table font to monospace
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-hide nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-document-title nil :family "Jost" :height 1.0))


(provide 'custom-functions)

;;; custom-functions.el ends here
