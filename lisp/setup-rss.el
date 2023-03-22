;;; Package -- RSS Configs
;;; Commentary:

;;; Code:
(eval-when-compile (require 'use-package))

(use-package elfeed
  :config
  (setq elfeed-feeds
	'("https://fasterthanli.me/rss"
	  "https://blog.while-true-do.io/rss"
	  "https://codewalkers.net/feed/"
	  "https://karthinks.com/index.xml"
	  "https://ochagavia.nl/blog/index.xml"
	  "https://takeonrules.com/index.xml")))

(provide 'setup-rss)

;;; setup-rss.el ends here

