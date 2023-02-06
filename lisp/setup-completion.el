;;; Package -- My UI and theme customizations
;;; Commentary:
;;; Code:

(eval-when-compile (require 'use-package))
		   
;; Install and setup Orderless
(use-package orderless
  :straight (:host github :repo "oantolin/orderless")
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Enable vertico
(use-package vertico
  :straight (:host github :repo "minad/vertico"
  :includes (vertico-directory)
  :files (:defaults "extensions/vertico-directory.el"))
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Install and configure Vertico
;; (use-package vertico
;;   :straight (:host github :repo "minad/vertico"
;;   :includes (vertico-directory)
;;   :files (:defaults "extensions/vertico-directory.el"))
;;   :init
;;   (vertico-mode))

;; (use-package savehist
;;   :init
;;   (savehist-mode))

 (use-package vertico-directory
   :after vertico
   :bind (:map vertico-map
 	      ("DEL" . vertico-directory-delete-char)
 	      ("M-DEL" . vertico-directory-delete-word))
   :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("M-y" . consult-yank-pop)))

 (provide 'setup-completion)

;;; setup-completion.el ends here
