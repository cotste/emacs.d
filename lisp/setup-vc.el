
;; VCS configurations

;; Install and configure Magit

(use-package magit
  :defer t
  :bind
  (("C-x g" . magit-status))
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 70)
  (set-face-attribute 'magit-section-heading nil :family "Monaspace Neon" :height 160)
  (set-face-attribute 'magit-branch-remote nil :family "Monaspace Neon" :height 140 :weight 'bold)
  (set-face-attribute 'magit-branch-local nil :family "Monaspace Neon" :height 140 :weight 'bold)
  (set-face-attribute 'magit-diff-file-heading nil :family "Monaspace Neon" :height 110))

(use-package magit-popup)
		       
(provide 'setup-vc)
