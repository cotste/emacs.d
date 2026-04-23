(use-package gptel
  :ensure t
  :config
  (setq gptel-backend
        (gptel-make-gh-copilot "Copilot"
          :stream t
          :models '(gpt-4
                    gpt-4o
                    claude-sonnet-4.6)))

  (setq gptel-model 'claude-sonnet-4.6)
  (setq gptel-default-mode 'org-mode) 
  (setq gptel-api-key (auth-source-pick-first-password :host "api.copilot.com"))
  (require 'gptel-tools-core)
  (require 'gptel-tools-fs)

  ;; Set your allowed directories here
  (setq gptel-tools/allowed-dirs
        (mapcar #'expand-file-name
                '("~/notes/ai-notes/"
                  "~/repos/ai-workspace")))

  ;; Enable tools for gptel sessions
  ;; (setq gptel-tools (list gptel-tools/create-directory
  ;;                     gptel-tools/create-file
  ;;                     gptel-tools/delete-file
  ;;                     gptel-tools/delete-directory
  ;;                     gptel-tools/list-directory))

  (setq gptel-org-branching-context t)
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "*Prompt:*\n")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "*Response:*\n")

  :bind ("C-c ," . gptel-send))

(use-package aidermacs
  :ensure t
  :bind (("C-c a" . aidermacs-transient-menu)))


(provide 'setup-ai)
