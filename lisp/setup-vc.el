
;; VCS configurations

;; Install and configure Magit

(use-package magit
  :defer t
  :bind
  (("C-x g" . magit-status))
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 70)
  (set-face-attribute 'magit-section-heading nil :family "Monaspace Xenon" :height 160)
  (set-face-attribute 'magit-branch-remote nil :family "Monaspace Xenon" :height 140 :weight 'bold)
  (set-face-attribute 'magit-branch-local nil :family "Monaspace Xenon" :height 140 :weight 'bold)
  (set-face-attribute 'magit-diff-file-heading nil :family "Monaspace Neon" :height 110))

(add-to-list 'project-switch-commands '(magit-project-status "Magit") t)

;; (use-package projectile
;;   :ensure t
;;   :custom
;;   (setq projectile-project-search-path '("~/repos/"))
;;   :config
;;   (projectile-mode +1)
;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Turn off vc-mode
;; (with-eval-after-load 'vc
;;   (remove-hook 'find-file-hook 'vc-find-file-hook)
;;   (remove-hook 'find-file-hook 'vc-refresh-state)
;;   (setq vc-handled-backends nil))

(use-package magit-popup)
		       
(provide 'setup-vc)
