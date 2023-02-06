
;; Install and configure which-key
(use-package which-key
  :config
  (which-key-mode))

;; Configure Kill prefix
(global-set-key (kbd "C-c k w") 'kill-buffer-and-window)


(provide 'setup-keybindings)

;;; setup-keybindings.el ends here
