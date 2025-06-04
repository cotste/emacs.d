
;; Install and setup Olivetti mode for writing

(setq-default fill-column 80)

(use-package olivetti
  :ensure t
  :config
	(olivetti-set-width 120)
	(setq olivetti-style t)
    :hook ((org-mode mu4e-view-mode mu4e-compose-mode info-mode) . olivetti-mode))

(use-package flyspell-correct
  :ensure t
  :after flyspell
  :bind
  (:map flyspell-mode-map ("C-;" . 'flyspell-correct-wrapper)))

(use-package grip-mode
  :ensure t
  :config
  (setq grip-command 'go-grip)
  (setq grip-preview-use-webkit t)
  :bind
  (:map markdown-mode-command-map
        ("C-c g" . grip-mode))
  (:map org-mode-map
        ("C-c g" . grip-mode)))

(provide 'setup-writing)
