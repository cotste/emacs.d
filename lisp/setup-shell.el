
;;; Code:

;; Install vterm
(use-package vterm
  :config
  (set-face-attribute 'vterm-color-black nil :foreground "#263238")
  (set-face-attribute 'vterm-color-magenta nil :foreground "#673AB7")
  (set-face-attribute 'vterm-color-yellow nil :foreground "#FFAB91")
  (set-face-attribute 'vterm-color-blue nil :foreground "#90A4AE")
  (set-face-attribute 'vterm-color-red nil :foreground "#263238" :weight 'bold)
  (set-face-attribute 'vterm-color-green nil :foreground "#000000")
  (set-face-attribute 'vterm-color-cyan nil :foreground "#000000"))

;;(use-package exec-path-from-shell
;;  :config
;;  (exec-path-from-shell-initialize))

(provide 'setup-shell)

