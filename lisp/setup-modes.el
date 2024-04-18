;;; Package -- My modes
;;; Commentary:

(define-minor-mode zuco-mode
  "Settings I always want"
  :keymap (let ((zuco-keymap (make-sparse-keymap)))
            (define-key zuco-keymap (kbd "M-o") 'ace-window)
            zuco-keymap))

(provide 'setup-modes)

;;; setup-modes.el ends here
