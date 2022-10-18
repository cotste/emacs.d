;;; Package -- custom-functions.el
;;; Commentary:

;;; Code:

;; Check if host is chaos
(defun host-is-chaos ()
  "Return non-nil if hostname is chaos."
  (string-equal (system-name) "chaos"))

(defun host-is-chq-aidaib ()
  "Return non-nil if hostname is chq-aidaib"
  (string-equal (system-name) "chq-aidaib"))

(provide 'custom-functions)

;;; custom-functions.el ends here
