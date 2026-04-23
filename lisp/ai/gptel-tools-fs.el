;;; gptel-tools-fs.el --- Filesystem tools for gptel -*- lexical-binding: t -*-

;;; Commentary:
;; Filesystem tool definitions for gptel: create, delete and list
;; files and directories. All operations are restricted to
;; `gptel-tools/allowed-dirs' defined in gptel-tools-core.

;;; Code:

(require 'gptel-tools-core)

(defun gptel-tools/fs--resolve (path)
  "Convenience wrapper: expand PATH and resolve to a safe absolute path."
  (let* ((expanded (expand-file-name path))
         (base (or (gptel-tools/find-base-dir expanded)
                   (car gptel-tools/allowed-dirs))))
    (gptel-tools/resolve-safe-path base expanded)))

(defvar gptel-tools/create-directory
  (gptel-make-tool
 :name "create_directory"
 :description (format "Create a directory within one of the allowed workspaces.\nAllowed directories:\n%s"
                      (gptel-tools/allowed-dirs-description))
 :args '((:name "path"
          :type string
          :description "Absolute or relative path of directory to create"))
 :function (lambda (path)
             (condition-case err
                 (let ((safe-path (gptel-tools/fs--resolve path)))
                   (if (file-directory-p safe-path)
                       (format "Directory already exists: %s" safe-path)
                     (make-directory safe-path t)
                     (format "Created directory: %s" safe-path)))
               (error (format "Error: %s" (error-message-string err)))))))

(defvar gptel-tools/create-file
  (gptel-make-tool
 :name "create_file"
 :description (format "Create a file with content within one of the allowed workspaces.\nAllowed directories:\n%s"
                      (gptel-tools/allowed-dirs-description))
 :args '((:name "path"
          :type string
          :description "Absolute or relative path of file to create")
         (:name "content"
          :type string
          :description "Content to write to the file"))
 :function (lambda (path content)
             (condition-case err
                 (let ((safe-path (gptel-tools/fs--resolve path)))
                   (if (gptel-tools/confirm-overwrite safe-path)
                       (progn
                         (make-directory (file-name-directory safe-path) t)
                         (write-region content nil safe-path)
                         (format "Created file: %s" safe-path))
                     (format "Aborted: user declined to overwrite '%s'" safe-path)))
               (error (format "Error: %s" (error-message-string err)))))))

(defvar gptel-tools/delete-file
  (gptel-make-tool
 :name "delete_file"
 :description (format "Delete a file within one of the allowed workspaces.\nAllowed directories:\n%s"
                      (gptel-tools/allowed-dirs-description))
 :args '((:name "path"
          :type string
          :description "Absolute or relative path of file to delete"))
 :function (lambda (path)
             (condition-case err
                 (let ((safe-path (gptel-tools/fs--resolve path)))
                   (if (gptel-tools/confirm-delete safe-path)
                       (progn
                         (delete-file safe-path)
                         (format "Deleted file: %s" safe-path))
                     (format "Aborted: user declined to delete '%s'" safe-path)))
               (error (format "Error: %s" (error-message-string err)))))))

(defvar gptel-tools/delete-directory
  (gptel-make-tool
 :name "delete_directory"
 :description (format "Recursively delete a directory within one of the allowed workspaces.\nAllowed directories:\n%s"
                      (gptel-tools/allowed-dirs-description))
 :args '((:name "path"
          :type string
          :description "Absolute or relative path of directory to delete"))
 :function (lambda (path)
             (condition-case err
                 (let ((safe-path (gptel-tools/fs--resolve path)))
                   (if (yes-or-no-p (format "Recursively delete '%s' and ALL its contents? " safe-path))
                       (progn
                         (delete-directory safe-path t)
                         (format "Deleted directory: %s" safe-path))
                     (format "Aborted: user declined to delete '%s'" safe-path)))
               (error (format "Error: %s" (error-message-string err)))))))

(defvar gptel-tools/list-directory
  (gptel-make-tool
 :name "list_directory"
 :description (format "List contents of a directory within one of the allowed workspaces.\nAllowed directories:\n%s"
                      (gptel-tools/allowed-dirs-description))
 :args '((:name "path"
          :type string
          :description "Absolute or relative path of directory to list"))
 :function (lambda (path)
             (condition-case err
                 (let ((safe-path (gptel-tools/fs--resolve path)))
                   (if (file-directory-p safe-path)
                       (mapconcat #'identity (directory-files safe-path) "\n")
                     (format "Error: '%s' is not a directory" safe-path)))
               (error (format "Error: %s" (error-message-string err)))))))

(provide 'gptel-tools-fs)
;;; gptel-tools-fs.el ends here
