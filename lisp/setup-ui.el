;; My UI and theme customizations

;; Set up fonts
(set-face-attribute 'default nil :family "Roboto Mono Nerd Font" :height 110)

;; Modus options

(setq modus-themes-completions
      '((matches . (extrabold background intense))))

;; Load the modus theme

(load-theme 'modus-operandi)

;; All the icons stuff

(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :config
  (all-the-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup))
  
  


(provide 'setup-ui)
