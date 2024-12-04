;;; Package -- override-functions.el
;;; Commentary: My function overrides to deal with behavior I don't like.

;;; Code:


;; (with-eval-after-load "org"
;;   ;; Lowercase the property drawer
;;   (defun org-insert-property-drawer ()
;;   "Insert a property drawer into the current entry.
;; Do nothing if the drawer already exists.  The newly created
;; drawer is immediately hidden."
;;   (org-with-wide-buffer
;;    ;; Set point to the position where the drawer should be inserted.
;;    (if (or (not (featurep 'org-inlinetask)) (org-inlinetask-in-task-p))
;;        (org-back-to-heading-or-point-min t)
;;      (org-with-limited-levels (org-back-to-heading-or-point-min t)))
;;    (if (org-before-first-heading-p)
;;        (while (and (org-at-comment-p) (bolp)) (forward-line))
;;      (forward-line)
;;      (when (looking-at-p org-planning-line-re) (forward-line)))
;;    (unless (looking-at-p org-property-drawer-re)
;;      ;; Make sure we start editing a line from current entry, not from
;;      ;; next one.  It prevents extending text properties or overlays
;;      ;; belonging to the latter.
;;      (when (and (bolp) (> (point) (point-min))) (backward-char))
;;      (let ((begin (if (bobp) (point) (1+ (point))))
;; 	   (inhibit-read-only t))
;;        (unless (bobp) (insert "\n"))
;;        (insert ":properties:\n:end:")
;;        (org-fold-region (line-end-position 0) (point) t (if (eq org-fold-core-style 'text-properties) 'drawer 'outline))
;;        (when (or (eobp) (= begin (point-min))) (insert "\n"))
;;        (org-indent-region begin (point)))))))


(provide 'override-functions)

;;; override-functions.el ends here
