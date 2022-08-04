
;; Install and setup Olivetti mode for writing

(use-package olivetti
  :config (olivetti-set-width 78)
  :hook ((org-mode text-mode info-mode) . olivetti-mode))


(provide 'setup-writing)
