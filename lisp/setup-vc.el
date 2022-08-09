
;; VCS configurations

;; Install and configure Magit

(use-package magit
  :bind
  (("C-x g" . magit-status))
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 70)
  (set-face-attribute 'magit-section-heading nil :family "Roboto" :height 160)
  (set-face-attribute 'magit-branch-remote nil :family "Roboto" :height 140 :weight 'bold)
  (set-face-attribute 'magit-branch-local nil :family "Roboto" :height 140 :weight 'bold)
  (set-face-attribute 'magit-diff-file-heading nil :family "Roboto" :height 110))

(use-package git-auto-commit-mode
  :config
  (setq gac-automatically-push-p t)
  (setq gac-automatically-add-new-files-p t))
		       
(provide 'setup-vc)
