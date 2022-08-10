
;; Auto save backup location
(setq backup-directory-alist
      `((".*" . ,(concat user-cache-directory "backups"))))


;; Boot strap straight

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-cache-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Setup Windows browser when in WSL
(when (and (eq system-type 'gnu/linux)
           (string-match
            "Linux.*Microsoft.*Linux"
            (shell-command-to-string "uname -a")))
  (setq
   browse-url-generic-program  "/mnt/c/Windows/System32/cmd.exe"
   browse-url-generic-args     '("/c" "start")
   browse-url-browser-function #'browse-url-generic))

(require 'setup-org)
(require 'setup-roam)
(require 'setup-mail)
(require 'setup-vc)
(require 'setup-writing)
(require 'setup-shell)
(require 'setup-completion)
(require 'setup-minibuffer)
(require 'setup-ui)
(require 'setup-config)
(require 'setup-keybindings)
