;;; Package: --- My init.el
;;; Commentary:

;;; Code:

(require 'custom-functions)

;;;;; Set some default frame settings

(when (host-is-chaos)
  (message "The host is chaos"))

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

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq scroll-margin 8)

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(terraform--resource-name-face ((t (:foreground "dim gray" :weight bold))))
 '(terraform--resource-type-face ((t (:foreground "black"))))
 ;; '(treemacs-directory-collapsed-face ((t (:inherit treemacs-directory-face :height 0.8))))
 ;; '(treemacs-directory-face ((t (:inherit font-lock-function-name-face :height 0.8))))
 ;; '(treemacs-file-face ((t (:inherit default :height 0.8))))
 ;; '(treemacs-root-face ((t (:inherit font-lock-constant-face :height 0.8))))
 ;; '(treemacs-root-unreadable-face ((t (:inherit treemacs-root-face :height 0.8)))))
 )

(provide 'init)

;;; init.el ends here
