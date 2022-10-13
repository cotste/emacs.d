;;; Package -- My UI and theme customizations
;;; Commentary:

;;; Code:
;; Set up fonts
(set-face-attribute 'default nil :family "Roboto Mono Nerd Font" :height 100)
;;(set-face-attribute 'default nil :family "Fantasque Sans Mono" :height 90)
(set-face-attribute 'fixed-pitch nil :family "Roboto Mono Nerd Font")
(set-face-attribute 'fixed-pitch-serif nil :family "SpaceMono Nerd Font")

(setq default-frame-alist '((undecorated . t)))
(setq frame-resize-pixelwise t)

;;;;; Set some default frame settings
(setq-default initial-frame-alist
              (append (list
                       ;;'(fullscreen . maximized)
                       ;; '(width . 175)
                       ;; '(height . 60)
                       '(internal-border-width . 18)
                       '(tool-bar-lines . 0)
                       '(vertical-scroll-bars . nil)
                       '(horizontal-scroll-bars . nil)
                       )))
(setq-default default-frame-alist
              (append (list
                       '(frame-title-format . nil)
                       '(internal-border-width . 18)
                       '(tool-bar-lines . 0)
                       '(vertical-scroll-bars . nil)
                       '(horizontal-scroll-bars . nil)
                       )))
;; Add some space on both sides of frames
(set-fringe-mode 10)

;; Add a header line to put some space at the top of the window
;;(setq-default header-line-format " ")
;;(set-face-attribute 'header-line nil :height 1.1 :background "#FFFFFF")

;; Set the window divider color
;; needs to be adjusted per theme
(setq window-divider-default-right-width 1)
(set-face-attribute 'window-divider nil :foreground "#90A4AE")
(window-divider-mode)

;; Modus options
(setq modus-themes-completions
      '((matches . (extrabold background intense))))
;;(setq modus-themes-syntax '(green-strings alt-syntax yellow-comments))
(setq modus-themes-mixed-fonts t)
(setq modus-themes-headings
      '((1 . (variable-pitch 1.4))
        (2 . (fixed-pitch-serif 1.3))
        (3 . (fixed-pitch-serif 1.2))
        (4 . (fixed-pitch-serif 1.1))
        (5 . (fixed-pitch-serif 1.0))
        (6 . (fixed-pitch-serif 1.0))))
(setq modus-themes-vivendi-color-overrides
      '((bg-main . "#24283b")
        (bg-dim . "#24283b")
        (bg-alt . "#35394c")))
(setq modus-themes-fringes 'nil)
(setq modus-themes-bold-constructs t)
(setq modus-themes-italic-constructs t)
(setq modus-themes-modeline '(3d moody accented))

;; (setq modus-themes-operandi-color-overrides
;;       '((blue . "#275ccf")
;; 	 (cyan . "#000000")
;; 	 (green . "#00ff00")
;; 	 (yellow . "#00ff00")
;; 	 (magenta-alt-other . "#115511")
;; 	 (magenta-alt . "#00ff00")
;; 	 (magenta . "#ffff00")))

;; Lambda Theme
(use-package lambda-themes
  :straight (:type git :host github :repo "lambda-emacs/lambda-themes"))

;; Nord theme

(use-package nord-theme)

;; SanityInc Tomorrow theme
(use-package color-theme-sanityinc-tomorrow)

;; FlucUI (FlatUI) Theme
(use-package flucui-themes)

(use-package flatui-theme)

(use-package doom-themes)

;; Nano Theme
(use-package nano-theme
  :straight (:type git :site github :repo "rougier/nano-theme"))

(use-package apropospriate-theme)

;; Load theme

;;(load-theme 'flatui t)
;;(load-theme 'tango t)
(load-theme 'nano-light t)
;;(load-theme 'modus-operandi)
;;(load-theme 'lambda-light t)
;;(load-theme 'flucui-light t)
;;(load-theme 'sanityinc-tomorrow-day t)
;;(load-theme 'leuven)
;;(load-theme 'nord t)
;;(load-theme 'doom-tokyo-night t)
;;(load-theme 'doom-nord-light t)


;; All the icons stuff

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))
  
(provide 'setup-ui)
