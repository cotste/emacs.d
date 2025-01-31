;; Package: --- My init.el
;;; Commentary:

;;; Code:


(require 'custom-functions)

;;(setq flycheck-emacs-lisp-load-path 'inherit)

;; Auto save backup location
(setq backup-directory-alist
      `((".*" . ,(concat user-cache-directory "backups"))))

;; Elpaca
(defvar elpaca-installer-version 0.8)
(defvar elpaca-directory (expand-file-name "elpaca/" user-cache-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  ;; Enable Elpaca support for use-package's :ensure keyword.
  (elpaca-use-package-mode))

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
;;(require 'setup-mail)
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
(require 'setup-modes)
(require 'setup-ai)
(require 'override-functions)
(require 'setup-graphql)

(require 'wgrep)

(recentf-mode)

(setq dired-kill-when-opening-new-dired-buffer t)

(when (string-equal system-name "moros")
  (setq nano-font-family-monospaced "Monaspace Xenon")
  (setq nano-font-family-proportional (face-attribute 'variable-pitch :family))
  (setq nano-font-size 12)
  (setq mode-line-format nil)
  ;;(require 'nano)
  ;;(require 'nano-base-colors)
  ;;(require 'nano-colors)
  ;;(require 'nano-faces)
  ;;(require 'nano-theme-support)
  (require 'nano-theme)
  ;;(require 'nano-theme-dark)
  ;;(require 'nano-theme-light)
  (require 'nano-modeline)
  ;;(require 'nano-layout)
  ;;(require 'nano-defaults)
  ;;(require 'nano-compact)
  (require 'nano-splash)
  (nano-modeline-text-mode t)
  (load-theme 'nano t)
  (my-mode-hooks))
;;(setq catppuccin-flavor 'frappe)

  ;;(add-hook 'window-setup-hook 'cotste-light-theme))
  
(when (string-equal system-name "persephone")
  (setq catppuccin-flavor 'frappe)
  (load-theme 'catppuccin t))

;;(set-face-attribute 'completions-common-part nil :inherit 'orderless-match-face-0)
;;(set-face-attribute 'completions-first-difference nil :inherit 'orderless-match-face-0)
;;(set-face-foreground 'completions-common-part
;;                     (face-foreground 'orderless-match-face-0))

;;(put 'narrow-to-region 'disabled nil)

(provide 'init)

;;; init.el ends here

