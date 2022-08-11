;; My UI and theme customizations

;; Set up fonts
(set-face-attribute 'default nil :family "Roboto Mono Nerd Font" :height 110)
;;(set-face-attribute 'default nil :family "Fantasque Sans Mono" :height 110)
(set-face-attribute 'fixed-pitch nil :family "Roboto Mono Nerd Font")
(set-face-attribute 'fixed-pitch-serif nil :family "SpaceMono Nerd Font")

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

;; Lambda Theme
(use-package lambda-themes
  :straight (:type git :host github :repo "lambda-emacs/lambda-themes"))

;; Nord theme

(use-package nord-theme)

;; SanityInc Tomorrow theme
(use-package color-theme-sanityinc-tomorrow)

;; FlucUI (FlatUI) Theme
(use-package flucui-themes)

;; Load theme

(load-theme 'modus-operandi)
;;(load-theme 'lambda-light)
;;(load-them 'flucui-light)
;;(load-theme 'sanityinc-tomorrow-day)
;;(load-theme 'leuven)
;;(load-theme 'nord)



;; All the icons stuff

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))
  
  


(provide 'setup-ui)
