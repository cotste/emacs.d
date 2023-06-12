;; Package: --- My init.el
;;; Commentary:

;;; Code:


(require 'custom-functions)

(setq flycheck-emacs-lisp-load-path 'inherit)

;; Auto save backup location
(setq backup-directory-alist
      `((".*" . ,(concat user-cache-directory "backups"))))

;; Boot strap straight
(setq straight-repository-branch "develop")
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
(add-to-list 'exec-path "/home/chq-stephenco/bin")
(add-to-list 'exec-path "/home/chq-stephenco/go/bin")
(add-to-list 'exec-path "/home/chq-stephenco/.local/bin")


;;; wl-clip integration
  ;; credit: yorickvP on Github
  (setq wl-copy-process nil)
  (defun wl-copy (text)
    (setq wl-copy-process (make-process :name "wl-copy"
                                        :buffer nil
                                        :command '("wl-copy" "-f" "-n")
                                        :connection-type 'pipe))
    (process-send-string wl-copy-process text)
    (process-send-eof wl-copy-process))
  (defun wl-paste ()
    (if (and wl-copy-process (process-live-p wl-copy-process))
        nil ; should return nil if we're the current paste owner
        (shell-command-to-string "wl-paste -n | tr -d \r")))
  (setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)

;; Set tab to completion - might get rid of this in the future
(setq tab-always-indent 'complete)

;; Turn off the stupid bell
(setq visible-bell t)

;; Put backup files in /tmp
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory)))

;;; Clean up old backup files
;; (message "Deleting old backup files...")
;; (let ((week (* 60 60 24 7))
;;       (current (float-time (current-time))))
;;   (dolist (file (directory-files temporary-file-directory t))
;;     (when (and (backup-file-name-p file)
;;                (> (- current (float-time (fifth (file-attributes file))))
;;                   week))
;;       (message "%s" file)
;;       (delete-file file))))

;; Set up some sane scrolling
(setq scroll-step 1
      scroll-conservatively 10000
      scroll-margin 8
      pixel-scroll-precision-mode t)

(setq fill-column 80)

(require 'setup-ui)
(require 'setup-org)
(require 'setup-notes)
(require 'setup-mail)
(require 'setup-vc)
(require 'setup-writing)
(require 'setup-shell)
(require 'setup-completion)
(require 'setup-minibuffer)
(require 'setup-config)
(require 'setup-keybindings)
(require 'setup-programming)
(require 'setup-rss)
(require 'setup-hydra)

(require 'wgrep)


;;(setq catppuccin-flavor 'latte)
;;(nano-modeline-mode)
(recentf-mode)

;;; Custom Font settings
(set-face-attribute 'xref-file-header nil :weight 'bold)

(add-hook 'window-setup-hook 'zuco-dark-theme)

(provide 'init)

;;; init.el ends here
