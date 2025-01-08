
;; Install and configure which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Configure Kill prefix
(global-set-key (kbd "C-c k w") 'kill-buffer-and-window)
(global-set-key (kbd "C-c r") 'async-shell-command)

(global-set-key (kbd "C-c C-t") 'zuco-switch-theme)

(use-package evil
  :ensure t
  :config
  (evil-mode 0))

(provide 'setup-keybindings)

;;; setup-keybindings.el ends here
