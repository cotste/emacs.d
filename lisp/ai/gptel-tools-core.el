;;; gptel-tools-core.el --- Core safety utilities for gptel tools -*- lexical-binding: t -*-

;;; Commentary:
;; Provides path validation and confirmation utilities for gptel tools.
;; All tool definitions should use these functions to ensure safe operation.

;;; Code:

(defgroup gptel-tools nil
  "Configuration for gptel tool safety and access control."
  :group 'gptel
  :prefix "gptel-tools/")

(defcustom gptel-tools/allowed-dirs
  (mapcar #'expand-file-name '("~/projects/ai-workspace/"))
  "List of directories that gptel tools are permitted to access.
All paths must be absolute and will be expanded via `expand-file-name'."
  :type '(repeat directory)
  :group 'gptel-tools)

(defun gptel-tools/safe-path-p (path)
  "Return t if PATH is within any of `gptel-tools/allowed-dirs'."
  (let ((expanded (expand-file-name path)))
    (seq-some (lambda (allowed-dir)
                (string-prefix-p allowed-dir expanded))
              gptel-tools/allowed-dirs)))

(defun gptel-tools/resolve-safe-path (base-dir path)
  "Resolve PATH relative to BASE-DIR, error if outside allowed dirs."
  (let ((full-path (expand-file-name path base-dir)))
    (if (gptel-tools/safe-path-p full-path)
        full-path
      (error "Path '%s' is outside all allowed directories: %s"
             path
             (mapconcat #'identity gptel-tools/allowed-dirs ", ")))))

(defun gptel-tools/find-base-dir (path)
  "Find which allowed directory PATH belongs to, or nil if none."
  (let ((expanded (expand-file-name path)))
    (seq-find (lambda (allowed-dir)
                (string-prefix-p allowed-dir expanded))
              gptel-tools/allowed-dirs)))

(defun gptel-tools/allowed-dirs-description ()
  "Return a formatted string of allowed directories for tool descriptions."
  (mapconcat (lambda (dir) (format "  - %s" dir))
             gptel-tools/allowed-dirs "\n"))

(defun gptel-tools/confirm-overwrite (path)
  "Prompt user to confirm overwriting PATH if it already exists.
Returns t if safe to proceed, nil if user declined."
  (if (file-exists-p path)
      (y-or-n-p (format "File '%s' already exists. Overwrite? " path))
    t))

(defun gptel-tools/confirm-delete (path)
  "Prompt user to confirm deletion of PATH.
Returns t if safe to proceed, nil if user declined or file missing."
  (if (file-exists-p path)
      (yes-or-no-p (format "Permanently delete '%s'? " path))
    (progn
      (message "Path '%s' does not exist, nothing to delete." path)
      nil)))

;; Runtime directory management
(defun gptel-tools/add-allowed-dir (dir)
  "Add DIR to `gptel-tools/allowed-dirs'."
  (interactive "DAdd allowed directory: ")
  (let ((expanded (expand-file-name dir)))
    (unless (member expanded gptel-tools/allowed-dirs)
      (add-to-list 'gptel-tools/allowed-dirs expanded)
      (message "Added allowed directory: %s" expanded))))

(defun gptel-tools/remove-allowed-dir (dir)
  "Remove DIR from `gptel-tools/allowed-dirs'."
  (interactive (list (completing-read "Remove allowed directory: "
                                      gptel-tools/allowed-dirs nil t)))
  (setq gptel-tools/allowed-dirs (delete dir gptel-tools/allowed-dirs))
  (message "Removed allowed directory: %s" dir))

(defun gptel-tools/list-allowed-dirs ()
  "Display the currently allowed directories."
  (interactive)
  (message "Allowed dirs:\n%s"
           (mapconcat #'identity gptel-tools/allowed-dirs "\n")))

(provide 'gptel-tools-core)
;;; gptel-tools-core.el ends here
