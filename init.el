;;; Package: --- My init.el
;;; Commentary:

;;; Code:


(require 'custom-functions)

(setq flycheck-emacs-lisp-load-path 'inherit)

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

;; Set up some paths
;;(setq default-directory "~/")
;;(add-to-list 'exec-path "~/bin")
;;(add-to-list 'exec-path "/home/chq-stephenco/.nvm/versions/node/v17.9.0/bin")

;; Set tab to completion - might get rid of this in the future
(setq tab-always-indent 'complete)

;; Turn off the stupid bell
(setq visible-bell t)

;; Set up some sane scrolling
(setq scroll-step 1
      scroll-conservatively 10000
      scroll-margin 8
      pixel-scroll-precision-mode t)

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
(require 'setup-programming)

(require 'wgrep)

(load-theme 'modus-operandi t)

(provide 'init)

;;; init.el ends here
