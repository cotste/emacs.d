;; My UI and theme customizations

;; Set up fonts
(set-face-attribute 'default nil :family "Iosevka" :height 110)

;; Modus options

(setq modus-themes-completions
      '((matches . (extrabold background intense))))

;; Load the modus theme

(load-theme 'modus-operandi)

(set-face-attribute 'magit-section-heading nil :height 160)
(set-face-attribute 'magit-branch-remote nil :height 140 :weight 'bold)
(set-face-attribute 'magit-branch-local nil :height 140 :weight 'bold)

(provide 'setup-ui)
