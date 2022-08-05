

;; Install and setup Orderless

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Install and configure Vertico

(use-package vertico
  :init
  (vertico-mode))

(provide 'setup-completion)
