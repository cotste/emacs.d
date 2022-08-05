
;; VCS configurations

;; Install and configure Magit

(use-package magit
  :bind
  (("C-x g" . magit-status))
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 70))

(use-package git-auto-commit-mode
  :config
  (setq gac-automatically-push-p t)
  (setq gac-automatically-add-new-files-p t))
		       
(provide 'setup-vc)
