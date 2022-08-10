;; My UI and theme customizations

;; Set up fonts
(set-face-attribute 'default nil :family "Roboto Mono Nerd Font" :height 110)

;; Modus options

(setq modus-themes-completions
      '((matches . (extrabold background intense))))

;; Load the modus theme

(load-theme 'modus-operandi)

(provide 'setup-ui)
