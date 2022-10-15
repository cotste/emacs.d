;;; package -- setup-config.el
;;; Commentary:

;;; Code:

;; Setup some shortcuts to get to config files

(defun cotste/edit-init-file ()
  (interactive)
  (find-file user-init-file))

(bind-key "C-c e i" 'cotste/edit-init-file)

(provide 'setup-config)

;;; setup-config.el ends here
