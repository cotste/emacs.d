;;; Package: --- setup-minibuffer.el
;;; Commentary:

;;; Code:

(eval-when-compile (require 'use-package))

;; Install and configure Marginalia
(elpaca marginalia
  :init
  (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :after (embark consult))

(provide 'setup-minibuffer)

;;; setup-minibuffer.el ends here
