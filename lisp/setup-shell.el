
;;; Code:

;; Install vterm
(use-package vterm
  :ensure t
  :config
  ;; (set-face-attribute 'vterm-color-black nil :foreground "#263238")
  ;; (set-face-attribute 'vterm-color-magenta nil :foreground "#673AB7")
  ;; (set-face-attribute 'vterm-color-yellow nil :foreground "#FFAB91")
  ;; (set-face-attribute 'vterm-color-blue nil :foreground "#90A4AE")
  ;; (set-face-attribute 'vterm-color-red nil :foreground "#263238" :weight 'bold)
  ;; (set-face-attribute 'vterm-color-green nil :foreground "#000000")
  ;; (set-face-attribute 'vterm-color-cyan nil :foreground "#000000"))
  :bind
  (("C-c v" . vterm)))

;;(use-package exec-path-from-shell
;;  :config
;;  (exec-path-from-shell-initialize))

;; (elpaca
;;  (eat :type git
;;        :host codeberg
;;        :repo "akib/emacs-eat"
;;        :files ("*.el" ("term" "term/*.el") "*.texi"
;;                "*.ti" ("terminfo/e" "terminfo/e/*")
;;                ("terminfo/65" "terminfo/65/*")
;;                ("integration" "integration/*")
;;                (:exclude ".dir-locals.el" "*-tests.el"))))

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview)
  :config
  (setq kubernetes-poll-frequency 3600
        kubernetes-redraw-frequency 3600))

(provide 'setup-shell)

