;;; package --- early-init.el
;;; Commentary:
;;; Code:

;;(require 'custom-functions)

(require 'disp-table)

(setq default-frame-alist
      (append (list
	           '(min-height . 1)
               '(height     . 45)
	           '(min-width  . 1)
               '(width      . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 24)
               '(left-fringe    . 1)
               '(right-fringe   . 1)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)
(when (fboundp 'tool-bar-mode) (tool-bar-mode nil))
(tooltip-mode 0)
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode nil))
(menu-bar-mode 0)
;; (global-hl-line-mode 1)
(setq x-underline-at-descent-line t)

;; Vertical window divider
(setq window-divider-default-right-width 1)
(setq window-divider-default-places 'right-only)
(window-divider-mode 1)

;; No ugly button for checkboxes
(setq widget-image-enable nil)

;; Hide org markup for README
(setq org-hide-emphasis-markers t)

(defun host-is-moros ()
  "Return non-nil if hostname is moros"
  (string-equal (system-name) "moros"))

;; (when (host-is-moros)
;;   (setq-default initial-frame-alist
;; 		(append (list
;; ;;			 '(fullscreen . maximized)
;; ;;                         '(width . 200)
;; ;;                         '(height . 52)
;; 			 '(internal-border-width . 18)
;; 			 '(tool-bar-lines . 0)
;; 			 '(vertical-scroll-bars . nil)
;; 			 '(horizontal-scroll-bars . nil)
;; 			 )))
;;   (setq-default default-frame-alist
;; 		(append (list
;; 			 '(frame-title-format . nil)
;; 			 '(internal-border-width . 18)
;; 			 '(tool-bar-lines . 0)
;; 			 '(vertical-scroll-bars . nil)
;; 			 '(horizontal-scroll-bars . nil)
;; 			 ))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Turn off decoration to get rid of the titlebar

;; Temporarily disabling removing the decoration while I work on this config
;; There are some issues with VcXsrv and full screen applications
;;(setq default-frame-alist '((undecorated . t)))

;;(setq inhibit-splash-screen t)

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
(add-to-list 'load-path (concat user-emacs-directory "lisp/ai"))

;; Recursively add all subdirectories of lisp/ to load-path
;;(let ((default-directory (expand-file-name "lisp/" user-emacs-directory)))
;;  (normal-top-level-add-subdirs-to-load-path))

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
