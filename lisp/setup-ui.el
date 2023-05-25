;;; Package -- My UI and theme customizations
;;; Commentary:

;;; Code:
(eval-when-compile (require 'use-package))

;; Set up fonts

;;(set-face-attribute 'default nil :family "RobotoMono Nerd Font" :height 100)
;;(set-face-attribute 'default nil :family "Inconsolata" :height 115 :weight 'Regular)
(set-face-attribute 'default nil :family "Iosevka Extended" :height 110)
;;(set-face-attribute 'variable-pitch nil :family "Source Sans Pro" :height 120)
(set-face-attribute 'variable-pitch nil :family "iA Writer Quattro V" :weight 'Regular :height 110)
;;(set-face-attribute 'fixed-pitch nil :family "RobotoMono Nerd Font" :height 100)
(set-face-attribute 'fixed-pitch nil :family "Iosevka Extended" :height 105 :weight 'regular)
;;(set-face-attribute 'default nil :family "Fantasque Sans Mono" :height 115)
;;(set-face-attribute 'fixed-pitch-serif nil :family "SpaceMono Nerd Font")


;;; Tab settings
(setq tab-width 4)

;;(setq default-frame-alist '((undecorated . t)))
(setq frame-resize-pixelwise t)

;; Add some space on both sides of frames
(set-fringe-mode 10)

;; Add a header line to put some space at the top of the window
;;(setq-default header-line-format " ")
;;(set-face-attribute 'header-line nil :height 1.1 :background "#FFFFFF")

;; Set the window divider color
;; needs to be adjusted per theme
;;(setq window-divider-default-right-width 1)
;;(set-face-attribute 'window-divider nil :foreground "#90A4AE")
;;(window-divider-mode)

;; Modus options
(defvar modus-themes-completions
      '((matches . (extrabold background intense))))

(setq modus-themes-syntax '(green-strings alt-syntax yellow-comments))
(setq masodus-themes-mixed-fonts t)
(setq modus-themes-headings
      '((1 . (variable-pitch 1.3))
        (2 . (fixed-pitch-serif 1.2))
        (3 . (fixed-pitch-serif 1.1))
        (4 . (fixed-pitch-serif 1.0))
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
(setq modus-themes-org-blocks 'gray-background)
(setq modus-themes-mixed-fonts t)

(customize-set-variable 'modus-operandi-palette-overrides
						'(
						  (bg-inactive "#e0e0e0")
						  (bg-main "#FAF9F6")
						  (fg-main "#21130d")

						  ;;(magenta-intense "#69a995")
						  ;;(magenta-cooler "#447c69")
						  ;;(magenta-warmer "#2c4d45")

						  (yellow-faint "#042f66")
						  (yellow-intense "#f3d000")
						  ;;(yellow-warmer

						  (blue-warmer "#505965")
						  (blue-intense "#377c8f")
						  (blue-cooler "#1979a9")
							
							(magenta "#713f94")
							(magenta-warmer "#653189")
							(magenta-cooler "#725686")

							(bg-completion "#e0e0e0")
							(fg-completion-match-0 red-faint)
							(fg-completion-match-1 blue-intense)
							(fg-completion-match-2 green-warmer)
							(fg-completion-match-3 red)

							(bg-paren-match bg-inactive)

							(builtin green-warmer)

							(rainbow-0 fg-main)
							(rainbow-1 red)
							(rainbow-2 blue-intense)
							(rainbow-3 green-intense)
							(rainbow-4 cyan-intense)
							(rainbow-5 yellow-intense)
							
							(fringe "#FAF9F6")
						  ))



(customize-set-variable 'modus-vivendi-palette-overrides
      '((bg-main "#232323")
				))

;; Lambda Theme
;;(use-package lambda-themes
;;  :straight (:type git :host github :repo "lambda-emacs/lambda-themes"))

;; Nord theme

;;(use-package nord-theme)

;; One Themes
(use-package one-themes)

;; Kaolin Themes
(use-package kaolin-themes)

;; SanityInc Tomorrow theme
(use-package color-theme-sanityinc-tomorrow)

;; FlucUI (FlatUI) Theme
(use-package flucui-themes)

;;(use-package flatui-theme)

(use-package doom-themes)

(use-package catppuccin-theme)

(use-package lab-themes)

(use-package leuven-theme)

(use-package ef-themes)

(use-package sublime-themes)

(use-package modus-themes)

(straight-use-package '(nano-theme :type git :host github
                                   :repo "rougier/nano-theme"))

;; All the icons stuff
(use-package all-the-icons
  :if (display-graphic-p))

;; All the icons
(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))

;;; Modeline configs
(straight-use-package '(nano-modeline :type git :host github
				      :repo "rougier/nano-modeline"))

(straight-use-package '(minibuffer-header :type git :host github
					  :repo "rougier/minibuffer-header"))

 (use-package doom-modeline
   :init
   (doom-modeline-mode 1))

;; Install and configure ace window
(use-package ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(global-set-key (kbd "M-o") 'ace-window)

(provide 'setup-ui)

;;; setup-ui.el ends here
