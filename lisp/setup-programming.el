
;; LSP Setup and config

(use-package lsp-mode
  :hook
  (( c++-mode terraform-mode yaml-mode js-mode java-mode) . lsp-deferred)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)

;; Completion setup and config

(use-package corfu
  :init
  (global-corfu-mode))

;; Terraform setup and config

(use-package terraform-mode)

;; YAML setup and config

(use-package yaml-mode)

;; Project setup

;; restclient setup

(use-package restclient
  :config
  (require 'restclient))

(provide 'setup-programming)
