

;; Install and setup Orderless

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Install and configure Vertico

(use-package vertico
  :straight (:host github :repo "minad/vertico"
		   :includes (vertico-directory)
		   :files (:defaults "extensions/vertico-directory.el"))
  :init
  (vertico-mode))


(use-package vertico-directory
  :after vertico
  :bind (:map vertico-map
	      ("DEL" . vertico-directory-delete-char)
	      ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package consult)

(provide 'setup-completion)
