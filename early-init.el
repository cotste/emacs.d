;;; package --- early-init.el
;;; Commentary:
;;; Code:

;;(require 'custom-functions)

(defun host-is-chq-aidaib ()
  "Return non-nil if hostname is chq-aidaib"
  (string-equal (system-name) "CHQ-AIDAIB-LX"))

(when (host-is-chq-aidaib)
  (setq-default initial-frame-alist
		(append (list
			 ;;'(fullscreen . maximized)
                         '(width . 200)
                         '(height . 52)
			 '(internal-border-width . 18)
;;			 '(tool-bar-lines . 0)
			 '(vertical-scroll-bars . nil)
			 '(horizontal-scroll-bars . nil)
			 )))
  (setq-default default-frame-alist
		(append (list
			 ;;'(frame-title-format . nil)
			 '(internal-border-width . 18)
;;			 '(tool-bar-lines . 0)
			 '(vertical-scroll-bars . nil)
			 '(horizontal-scroll-bars . nil)
			 ))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Turn off decoration to get rid of the titlebar

;; Temporarily disabling removing the decoration while I work on this config
;; There are some issues with VcXsrv and full screen applications
;;(setq default-frame-alist '((undecorated . t)))

(setq inhibit-splash-screen t)

;; Turn off package
(setq package-enable-at-startup nil)

;; Set up cache dir
(defvar user-cache-directory "~/.cache/emacs/")

;; Set up straight directories
(setq straight-base-dir user-cache-directory)

;; Use use-package for straight
(setq straight-use-package-by-default t)

;; Set up plugin and customization directory
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))

;; Auto save backup location
;;(setq backup-directory-alist
;;      `("." . ,(concat user-cache-directory "backups")))

;; Set the custom file
(setq custom-file "~/.config/emacs/custom.el")

;; Native Compilation stuff
(when (boundp 'native-comp-eln-load-path)
  (add-to-list 'native-comp-eln-load-path
	       (concat user-cache-directory "eln-cache"))
  (setq native-comp-async-report-warnings-errors 'silent
	native-comp-deferred-compilation t))

(setq warning-minimum-level :error)

(provide 'early-init)

;;; early-init.el ends here
