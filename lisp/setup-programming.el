

;;; Code:
;; LSP Setup and config

(setq-default indent-tabs-mode nil)

;; (use-package cape)

;; (use-package eglot
;;   :ensure t
;;   :hook ((( java-mode python-mode rust-mode) . eglot-ensure)))

;; (setq completion-category-overrides '((eglot (styles orderless))
;;                                       (eglot-capf (styles orderless))))

;;(use-package eglot-java :ensure nil)

(use-package jsonrpc :ensure nil)

(use-package eldoc :ensure nil)

(use-package eglot
  :ensure nil
  :hook ((( clojure-mode clojurec-mode clojurescript-mode
            java-mode scala-mode python-ts-mode yaml-ts-mode
            terraform-mode python-mode rust-mode rust-ts-mode rustic-mode)
          . eglot-ensure))
        ;;((cider-mode eglot-managed-mode) . eglot-disable-in-cider)
  :preface
  ;; (defun eglot-disable-in-cider ()
  ;;   (when (eglot-managed-p)
  ;;     (if (bound-and-true-p cider-mode)
  ;;         (progn
  ;;           (remove-hook 'completion-at-point-functions 'eglot-completion-at-point t)
  ;;           (remove-hook 'xref-backend-functions 'eglot-xref-backend t))
  ;;       (add-hook 'completion-at-point-functions 'eglot-completion-at-point nil t)
  ;;       (add-hook 'xref-backend-functions 'eglot-xref-backend nil t))))
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-extend-to-xref nil)
  (eglot-ignored-server-capabilities
   '(:hoverProvider
     ;;:documentHighlightProvider
     ;;:documentFormattingProvider
     ;;:documentRangeFormattingProvider
     ;;:documentOnTypeFormattingProvider
     ;;:colorProvider
     ;;:foldingRangeProvider))
  (eglot-stay-out-of '(yasnippet))
  :config
  (setq completion-category-overrides '((eglot (styles orderless))
                                        (eglot-capf (styles orderless))))
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))
  (add-to-list 'completion-at-point-functions #'eglot-completion-at-point))))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(python-mode . ("ruff" "server"))
               ;;'(python-ts-mode . ("ruff" "server"))
               '(python-ts-mode . ("pyright" "-w"))))

;; (use-package lsp-mode
;;   :hook
;;   ((python-mode c++-mode terraform-mode yaml-mode js-mode rust-mode shell-script-mode go-mode json-mode java-mode) . lsp-deferred)
;;   :commands lsp
;;   :config
;;   (define-key lsp-mode-map (kbd "C-c C-l") lsp-command-map)
;;   (setq lsp-headerline-breadcrumb-enable nil)
;;   (setq lsp-disabled-clients '(tfls pylsp))
;;   (setq lsp-completion-provider :none)
;;   (setq lsp-semantic-tokens-enable t)
;;   (setq lsp-semantic-tokens-honor-refresh-requests t)
;;   (setq lsp-terraform-ls-enable-show-reference t)
;;   (add-to-list 'completion-at-point-functions #'lsp-completion-at-point))



;; (defun corfu-lsp-setup ()
;;   ;;; Attempt to make corfu use orderless.
;;   (setq-local completion-styles '(orderless)
;; 	      completion-category-defaults nil))

;;(add-hook 'lsp-mode-hook #'corfu-lsp-setup)

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode
;;   :config (setq lsp-ui-doc-max-width 100)
;;   (setq lsp-ui-doc-position 'top))
  ;;(setq lsp-ui-doc-border "dark violet"))

;; ;; Java LSP
;; (use-package lsp-java
;;   :after lsp-mode
;;   :config
;;   (setq lsp-java-configuration-runtimes '[;;(:name "JavaSE-21"
;;                                           ;;       :path "/usr/lib/jvm/java-21"
;;                                           ;;       :default nil)
;; 					                                (:name "JavaSE-17"
;; 						                                     :path "/usr/lib/jvm/java-17"
;; 						                                     :default t)])
;;   (add-hook 'java-mode-hook 'lsp)
;;   :custom
;;   (lsp-java-server-install-dir (expand-file-name "~/.emacs.d/.cache/lsp/eclipse.jdt.ls/"))
;; ;;  (lsp-java-workspace-dir (expand-file-name "~/.emacs.d/eclipse.jdt.ls/workspace/"))
;;   )

;; (require 'dap-java)

;; (require 'lsp-java-boot)

;; (use-package company)

;; Completion setup and config
(use-package corfu
  :ensure t
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
(use-package terraform-mode :ensure t)

;; YAML setup and config
(use-package yaml-mode
  :ensure t
  :config
  (add-hook 'yaml-mode-hook 'display-line-numbers-mode)
  (add-hook 'yaml-mode-hook 'highlight-indent-guides-mode))

(use-package highlight-indent-guides
  :ensure t
	:config
	(setq highlight-indent-guides-method 'character)
    (setq highlight-indent-guides-auto-character-face-perc 50))

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Docker/Containerfile mode
(use-package dockerfile-mode :ensure t)

;; Flycheck
;;(use-package flycheck
;;  :init (global-flycheck-mode))

;; Project setup

;; restclient setup
(use-package restclient
  :ensure t
  :config
  (require 'restclient))

;; Setup Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (
	 (prog-mode-hook . rainbow-delimiters-mode)
	 (emacs-lisp-mode . rainbow-delimiters-mode)))

(use-package treemacs
  :ensure t
  :bind (:map global-map
	            ("C-x t t" . treemacs)
              ("C-x t s" . treemacs-select-window))
  :config
  (progn
    (setq treemacs-indentation 1)))

;;(use-package lsp-treemacs)

(elpaca (treemacs-all-the-icons))
;;(treemacs-load-theme 'all-the-icons)

;; Set up Rust

(use-package rust-mode
  :ensure t
  :config
  ;; Force indents to use spaces instead of tabs in rust-mode
  (add-hook 'rust-mode-hook
            (lambda () (setq indent-tabs-mode nil)))


  ;; Prettify symbols in Rust mode
  (add-hook 'rust-mode-hook
         ( lambda () (prettify-symbols-mode))))

(elpaca (cargo))

;; Install rustic
(use-package rustic
  :ensure t
  :config
  (setq rustic-lsp-client 'eglot))

;; Install go-mode
(elpaca (go-mode))

;; Turn on line numbers for all prog-mode buffers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'hcl-mode-hook 'display-line-numbers-mode)
(add-hook 'terraform-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook (lambda ()
					(setq tab-width 4)))

;;; Markdown configurations
(setq markdown-command "cmark")
;;(add-hook 'markdown-mode-hook 'auto-fill-mode)

;; (elpaca (kafka-cli :type git :host github
;; 				  :repo "ebbywiselyn/emacs-kafka"))

;; ;;; Kafka stuff
;; (setq kafka-cli-bin-path "/home/chq-stephenco/.local/bin/kafka_2.13-3.1.0/bin")
;; (setq kafka-cli-config-path "/home/chq-stephenco/.local/bin/kafka_2.13-3.1.0/bin")

;;; Python Configuration
(setq python-shell-interpreter "/usr/bin/python3.10")
(setq python-interpreter "/usr/bin/python3.10")

(elpaca (lsp-pyright))

;;(elpaca (pyenv))

(elpaca (pyvenv))

;;; GraphQL
(elpaca (graphql-mode))

(elpaca (sicp))

(elpaca (ansible))

;; Override the html modes with my keybinds
(add-hook 'html-mode-hook 'zuco-mode)
(add-hook 'mhtml-mode-hook 'zuco-mode)

;; Tree Sitter

(require 'treesit)
(setq treesit-extra-load-path '("/usr/local/lib/treesitter"))
;;(use-package tree-sitter)
;;(use-package tree-sitter-langs)
;;(add-hook 'prog-mode-hook 'tree-sitter-hl-mode)

(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-auto-mode t))

(setq major-mode-remap-alist
      '((python-mode . python-ts-mode)))

(provide 'setup-programming)

;;; setup-programming.el ends here
