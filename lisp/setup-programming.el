

;;; Code:
;; LSP Setup and config

(setq-default indent-tabs-mode nil)

;; (use-package cape)

;; (use-package eglot
;;   :ensure t
;;   :hook ((( java-mode python-mode rust-mode) . eglot-ensure)))

;; (setq completion-category-overrides '((eglot (styles orderless))
;;                                       (eglot-capf (styles orderless))))

;; (use-package eglot-java)

(use-package lsp-mode
  :hook
  ((python-mode c++-mode terraform-mode yaml-mode js-mode rust-mode shell-script-mode go-mode json-mode java-mode) . lsp-deferred)
  :commands lsp
  :config
  (define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-disabled-clients '(tfls pylsp)))

(setq lsp-completion-provider :none)
(setq lsp-semantic-tokens-enable t)
(setq lsp-semantic-tokens-honor-refresh-requests t)
(setq lsp-terraform-ls-enable-show-reference t)

;; (defun corfu-lsp-setup ()
;;   ;;; Attempt to make corfu use orderless.
;;   (setq-local completion-styles '(orderless)
;; 	      completion-category-defaults nil))

;;(add-hook 'lsp-mode-hook #'corfu-lsp-setup)

;; (add-to-list 'completion-at-point-functions #'lsp-completion-at-point)
;; (add-to-list 'completion-at-point-functions #'eglot-completion-at-point)

(use-package lsp-ui
  :commands lsp-ui-mode
  :config (setq lsp-ui-doc-max-width 100)
  (setq lsp-ui-doc-position 'top))
  ;;(setq lsp-ui-doc-border "dark violet"))

;; Java LSP
(use-package lsp-java
  :after lsp-mode
  :config
  (setq lsp-java-configuration-runtimes '[;;(:name "JavaSE-21"
                                          ;;       :path "/usr/lib/jvm/jre-21"
                                          ;;       :default nil)
					                                (:name "JavaSE-17"
						                                     :path "/usr/lib/jvm/jre-17"
						                                     :default t)])
  (add-hook 'java-mode-hook 'lsp)
  :custom
  (lsp-java-server-install-dir (expand-file-name "~/.emacs.d/.cache/lsp/eclipse.jdt.ls/"))
;;  (lsp-java-workspace-dir (expand-file-name "~/.emacs.d/eclipse.jdt.ls/workspace/"))
  )

;; (require 'dap-java)

;; (require 'lsp-java-boot)

;; (use-package company)

;; Completion setup and config
(use-package corfu
	:after orderless
  :custom
  (corfu-cycle t)
  (corfu-auto nil)
	(corfu-separator ?\s)
	(corfu-quit-no-match t)
	(corfu-quit-at-boundary nil)
  :init
  (global-corfu-mode))

(setq tab-always-indent 'complete)
(setq completion-cycle-threshold nil) ; Show all completion candidates

;; Terraform setup and config
(use-package terraform-mode)

;; YAML setup and config
(use-package yaml-mode)

(add-hook 'yaml-mode-hook 'display-line-numbers-mode)
(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)

(use-package highlight-indent-guides
	:config
	(setq highlight-indent-guides-method 'character))

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Docker/Containerfile mode
(use-package dockerfile-mode)

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

(use-package lsp-treemacs)

(use-package treemacs-all-the-icons)
(treemacs-load-theme 'all-the-icons)

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

;; Install go-mode
(use-package go-mode)

;; Turn on line numbers for all prog-mode buffers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'hcl-mode-hook 'display-line-numbers-mode)
(add-hook 'terraform-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook (lambda ()
					(setq tab-width 2)))

;;; Markdown configurations
(setq markdown-command "cmark")
;;(add-hook 'markdown-mode-hook 'auto-fill-mode)

;;(use-package company)

(straight-use-package '(kafka-cli :type git :host github
				  :repo "ebbywiselyn/emacs-kafka"))

;;; Kafka stuff
(setq kafka-cli-bin-path "/home/chq-stephenco/.local/bin/kafka_2.13-3.1.0/bin")
(setq kafka-cli-config-path "/home/chq-stephenco/.local/bin/kafka_2.13-3.1.0/bin")

;;; Python Configuration
(setq python-shell-interpreter "/usr/bin/python3.10")
(setq python-interpreter "/usr/bin/python3.10")
(use-package lsp-pyright)

;;; GraphQL

(use-package graphql-mode)

(use-package sicp)

(use-package ansible)

;; Override the html modes with my keybinds
(add-hook 'html-mode-hook 'zuco-mode)
(add-hook 'mhtml-mode-hook 'zuco-mode)

(provide 'setup-programming)

;;; setup-programming.el ends here
