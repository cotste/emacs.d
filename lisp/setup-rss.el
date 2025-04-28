;;; Package -- RSS Configs
;;; Commentary:

;;; Code:
(eval-when-compile (require 'use-package))

(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds
	'("https://fasterthanli.me/rss"
	  "https://blog.while-true-do.io/rss"
	  "https://codewalkers.net/feed/"
	  "https://karthinks.com/index.xml"
	  "https://ochagavia.nl/blog/index.xml"
	  "https://takeonrules.com/index.xml"
      "https://www.blogbyben.com/rss.xml"
      )))

(use-package elfeed-tube
  :ensure t
  :after elfeed
  :demand t
  :config
  ;; (setq elfeed-tube-auto-save-p nil) ; default value
  ;; (setq elfeed-tube-auto-fetch-p t)  ; default value
  (elfeed-tube-setup)

  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))

;; ---------------------
;; org capture in elfeed
;; ---------------------
(defun private/org-elfeed-entry-store-link ()
  (when elfeed-show-entry
    (let* ((link (elfeed-entry-link elfeed-show-entry))
           (title (elfeed-entry-title elfeed-show-entry)))
      (org-store-link-props
       :link link
       :description title)
      )))

(provide 'setup-rss)

;;; setup-rss.el ends here

