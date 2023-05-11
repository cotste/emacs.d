
;; Install and setup Olivetti mode for writing

 (use-package olivetti
   :config (olivetti-set-width 120)
   :hook ((org-mode mu4e-view-mode mu4e-compose-mode info-mode) . olivetti-mode))

(use-package flyspell-correct
  :after flyspell
  :bind
  (:map flyspell-mode-map ("C-;" . 'flyspell-correct-wrapper)))

(provide 'setup-writing)
