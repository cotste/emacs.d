
;; VCS configurations

;; Install and configure Magit

(use-package magit
  :bind
  (("C-x g" . magit-status))
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 70))
		       
(provide 'setup-vc)
