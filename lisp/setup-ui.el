;;; Package -- My UI and theme customizations
;;; Commentary:

;;; Code:
(eval-when-compile (require 'use-package))

;; Set up fonts
(set-face-attribute 'default nil :family "MonaspiceNe NF" :height 100)
(set-face-attribute 'variable-pitch nil :family "iA Writer Quattro V" :weight 'Regular :height 100)
(set-face-attribute 'fixed-pitch nil :family "MonaspiceNe NF" :height 100)
;;(set-face-attribute 'default nil :family "RobotoMono Nerd Font" :height 100)
;;(set-face-attribute 'default nil :family "Inconsolata" :height 115 :weight 'Regular)
;;(set-face-attribute 'default nil :family "Iosevka" :height 110)
;;(set-face-attribute 'variable-pitch nil :family "Vollkorn" :height 110)
;;(set-face-attribute 'variable-pitch nil :family "Monaspace Krypton" :height 125)
;;(set-face-attribute 'variable-pitch nil :family "Source Sans Pro" :height 120)
;;(set-face-attribute 'fixed-pitch nil :family "Iosevka Extended" :height 105 :weight 'regular)

(defface org-headers
  '((t :family "Monaspace Krypton"
       :height 110
       ))
  "my org headers face.")
  
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
      '((1 . (org-headers 1.2))
        (2 . (org-headers 1.1))
        (3 . (fixed-pitch-serif 1.0))
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

(setq modus-operandi-palette-overrides
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

;; Lambda Theme
;;(use-package lambda-themes)

;;(use-package material-theme)

;; Nord theme
;;(use-package nord-theme)

;; ;; One Themes
;; (use-package one-themes)

;; SanityInc Tomorrow theme
;;(use-package color-theme-sanityinc-tomorrow)

;; FlucUI (FlatUI) Theme
;;(use-package flucui-themes)

;; (use-package catppuccin-theme)

(elpaca kanagawa-themes)

;;(setq kanagawa-themes-custom-colors
;;      '((bg "#FFFFFF")))

;; (straight-use-package '(dracula-theme
;;                         :type git :host github
;;                         :repo "dracula/emacs"))
;; ;;; Nano Setup

(use-package nano-theme
  :ensure (:type git :host github :repo "rougier/nano-theme")
  :config
  (require 'nano-theme)
  (load-theme 'nano t))

(use-package nano-modeline :ensure (
                        :type git
                        :host github
                        :repo "rougier/nano-modeline"))

;; (use-package nano :ensure (
;;                         :type git
;;                         :host github
;;                         :repo "rougier/nano-emacs"))

;; (straight-use-package '(minibuffer-header
;;                         :type git
;;                         :host github
;;                         :repo "rougier/minibuffer-header"))

;; (straight-use-package '(nano-vertico
;;                         :type git
;;                         :host github
;;                         :repo "rougier/nano-vertico"))

;; (use-package nano-splash :ensure (
;;                         :type git
;;                         :host github
;;                         :repo "rougier/nano-splash"))

;; Nerd icons
(elpaca nerd-icons)

;; All the icons stuff
(elpaca all-the-icons)

;; All the icons
(elpaca all-the-icons-completion
  :config
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))

;;; Modeline configs

;;(use-package doom-modeline
  ;;:config
  ;;(setq doom-modeline-height 28)
  ;;:init
  ;;(doom-modeline-mode 0))

(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (global-set-key (kbd "M-o") 'ace-window))

;;(use-package rainbow-mode :ensure t)

(when (string-equal system-name "pan")
  ;;(require 'nano-theme)
  (setq nano-font-family-monospaced "Monaspace Xenon")
  (setq nano-font-family-proportional (face-attribute 'variable-pitch :family))
  (setq nano-font-size 12)
  (setq mode-line-format nil)
  ;;(require 'nano)
  ;;(require 'nano-base-colors)
  ;;(require 'nano-colors)
  ;;(require 'nano-faces)
  ;;(require 'nano-theme-support)
  ;;(require 'nano-theme-dark)
  ;;(require 'nano-theme-light)
  ;;(require 'nano-modeline)
  ;;(require 'nano-layout)
  ;;(require 'nano-defaults)
  ;;(require 'nano-compact)
  ;;(require 'nano-splash)
  ;;(nano-modeline-text-mode t)
  (my-mode-hooks)
  ;;(load-theme 'nano t)
  ;;(load-theme 'modus-operandi t)
  ;;(add-hook 'after-init-hook (lambda () (load-theme 'kanagawa-wave t nil)))
  ;;(load-theme 'kanagawa-wave t)
  ;;(load-theme 'modus-operandi t)
  )

(provide 'setup-ui)

;;; setup-ui.el ends here
