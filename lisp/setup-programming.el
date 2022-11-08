

;;; Code:
;; LSP Setup and config
(use-package lsp-mode
  :hook
  ((c++-mode terraform-mode yaml-mode js-mode java-mode rust-mode) . lsp-deferred)
  :commands lsp
  :config
  (define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map))

(use-package lsp-ui
  :commands lsp-ui-mode)

;; Java LSP
(use-package lsp-java
  :config
  (setq lsp-java-configuration-runtimes '[(:name "JavaSE-1.8"
                                                 :path "/usr/lib/jvm/java-1.8.0-openjdk-amd64"
                                                 :default nil)
					  (:name "JavaSE-17"
						 :path "/usr/lib/jvm/java-1.17.0-openjdk-amd64"
						 :default t)]))

(require 'dap-java)

(require 'lsp-java-boot)
;; Completion setup and config
(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  :init
  (global-corfu-mode))

;; Terraform setup and config
(use-package terraform-mode)

;; YAML setup and config
(use-package yaml-mode)

;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;; Project setup

;; restclient setup
(use-package restclient
  :config
  (require 'restclient))

;; Setup Rainbow Delimiters
(use-package rainbow-delimiters
  :hook (
	 (prog-mode-hook . rainbow-delimiters-mode)
	 (emacs-lisp-mode . rainbow-delimiters-mode)))

(use-package treemacs
  :bind (:map global-map
	      ("C-x t t" . treemacs)
              ("C-x t s" . treemacs-select-window))
  :config
  (progn
    (setq treemacs-indentation 1)))

;; Set up Rust

(use-package rust-mode)

;; Force indents to use spaces instead of tabs in rust-mode
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

;; Prettify symbols in Rust mode
(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))

(use-package cargo)

;; Install rustic
(use-package rustic)

;;(use-package company)

(provide 'setup-programming)

;;; setup-programming.el ends here
