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
      "https://www.blogbyben.com/rss.xml")))

(provide 'setup-rss)

;;; setup-rss.el ends here

