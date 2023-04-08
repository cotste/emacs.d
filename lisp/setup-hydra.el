;;; Package: --- setup-hydra.el
;;; Commentary:

;;; Code:

(require 'custom-functions)

(use-package hydra
  :bind
  ("C-c b" . hydra-browse/body)
  ("C-c n" . hydra-note/body)
  ("C-c t" . hydra-time/body))

(use-package posframe)

(use-package hydra-posframe
  :straight (:type git :host github :repo "ladicle/hydra-posframe")
  :config (setq hydra-posframe-parameters '((right-fringe . 20) (left-fringe . 5)))
  :hook (after-init . hydra-posframe-enable))

(use-package major-mode-hydra)

(defhydra hydra-browser (nil nil)
  "
  ^
  ^^            ^Browser^
  ^^^^----------------------------
  [_q_] Quit           [_m_] Edge
  ^^                   [_g_] Chrome
  ^^                   [_f_] Firefox
  ^^                   [_e_] Eww
  ^^                   ^^
  "
  ("q" nil)
  ("m" (message "Edge") :exit t)
  ("g" (message "Chrome") :exit t)
  ("f" (cotste/browse-url-with-gui) :exit t)
  ("e" (cotste/browse-url-with-eww) :exit t))

(defvar hydra--browse-title (all-the-icons-faicon "firefox" 1 -0.05 :height 3.0))
(defvar hydra--note-title (all-the-icons-faicon "sticky-note-o" 1 -0.05 :height 3.0))
(defvar hydra--time-title (all-the-icons-faicon "clock-o" 1 -0.05 :height 6.0))

(pretty-hydra-define hydra-browse
  (:color pink :title hydra--browse-title :quit-key "q")
  ("Browser"
   (("e" cotste/browse-url-with-eww "Browse with Eww" :exit t)
    ("d" cotste/browse-url-with-gui "Browse with Default" :exit t)
    ("s" cotste/browse-safelink-url "Browse Safelink" :exit t))
   "URL's"
   (("c" shr-copy-url "Copy URL" :exit t))))

(pretty-hydra-define hydra-note
  (:title hydra--note-title :quit-key "q")
  ("Denote"
   (("n" denote-create-note "New Denote" :exit t)
    ("t" denote-type "New Denote - Type" :exit t)
    ("r" denote-rename-file "Rename to Denote" :exit t)
    ("s" sjc-select-denote-silo "Select Denote Silo" :exit t))
   "Notes"
   (("l" notes-list "Notes List" :exit t)
    ("d" (dired "~/notes/denote") "Notes Directory" :exit t)
    ("f" sjc-denote-regex-search "Search Notes (text)" :exit t))
   "Journal"
   (("e" sjc/list-diary-notes "Journal Notes" :exit t)
    ("j" sjc/new-diary-note "Create Diary" :exit t))
   "Links"
   (("F" denote-link-find-file "Open Denote Link" :exit t))))

(pretty-hydra-define hydra-time
  (:title hydra--time-title :quit-key "q")
  ("Time Clock"
   (("i" org-clock-in "Clock In" :exit t)
    ("o" org-clock-out "Clock Out" :exit t)
    ("g" org-clock-goto "Goto Current Clock" :exit t)
    ("t" (find-file "~/notes/gtd/clocktable.org") "Open Time Sheet" :exit t))
   "Dates"
   (("c" calendar "Open Calendar" :exit t)
    ("D" org-deadline "Set Deadline" :exit t)
    ("S" org-schedule "Set Schedule" :exit t))))
  


(define-key elfeed-show-mode-map "B" 'hydra-browse/body)

(provide 'setup-hydra)

;;; setup-hydra.el ends here
