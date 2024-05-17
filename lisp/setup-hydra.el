;;; Package: --- setup-hydra.el
;;; Commentary:

;;; Code:

(require 'custom-functions)

(use-package hydra
  :bind
  ("C-c b" . hydra-browse/body)
  ("C-c n" . hydra-note/body)
  ("C-c t" . hydra-time/body)
  ("C-c e" . hydra-config/body)
  ("C-c f" . hydra-fonts/body)
  ("C-c m" . hydra-magit/body))

(use-package posframe)

(use-package hydra-posframe
  :straight (:type git :host github :repo "ladicle/hydra-posframe")
  :config (setq hydra-posframe-parameters '((right-fringe . 20) (left-fringe . 5)))
  :hook (after-init . hydra-posframe-mode))

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
(defvar hydra--emacs-title (all-the-icons-fileicon "emacs" 1 -0.05 :height 3.0))
(defvar hydra--note-title (all-the-icons-faicon "sticky-note-o" 1 -0.05 :height 3.0))
(defvar hydra--time-title (all-the-icons-faicon "clock-o" 1 -0.05 :height 6.0))
(defvar hydra--magit-title (all-the-icons-faicon "git" 1 -0.05 :height 6.0))
(defvar hydra--fonts-title (all-the-icons-faicon "font" 1 -0.05 :height 6.0))

(pretty-hydra-define hydra-browse
  (:color pink :title hydra--browse-title :quit-key "q")
  ("Browser"
   (("e" cotste/browse-url-with-eww "Browse with Eww" :exit t)
    ("d" cotste/browse-url-with-gui "Browse with Default" :exit t)
    ("s" cotste/browse-safelink-url "Browse Safelink" :exit t))
   "URL's"
   (("c" shr-copy-url "Copy URL" :exit t))))

(pretty-hydra-define hydra-fonts
  (:color pink :title hydra--browse-title :quit-key "q")
  ("Browser"
   (("u" (set-face-attribute 'default nil :height 130) "Scale fonts to 130" :exit t)
    ("d" (set-face-attribute 'default nil :height 110) "Scale fonts to 110" :exit t))))

(pretty-hydra-define hydra-note
  (:title hydra--note-title :quit-key "q")
  ("Denote"
   (("n" denote-signature "New Denote" :exit t)
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
    ("d" org-deadline "Set Deadline" :exit t)
    ("s" org-schedule "Set Schedule" :exit t))))

(pretty-hydra-define hydra-config
  (:title hydra--emacs-title :quit-key "q")
  ("Init"
   (("e" (find-file "~/.emacs.d/init.el") "Edit Init" :exit t)
    ("o" (dired "~/.emacs.d") "Open Config Dir" :exit t)
    ("l" (dired "~/.emacs.d/lisp") "Open Lisp Dir" :exit t)
    ("f" (consult-find "~/.emacs.d") "Search for file" :exit t))
   "Git"
   (("m" (magit-status "~/.emacs.d") "Magit" :exit t))))

;;Hydra for general Magit tasks
(pretty-hydra-define hydra-magit
  (:title hydra--magit-title :quit-key "q")
  ("Clone"
   (("c" (magit-clone) "Clone Repo" :exit t)
    ("e" (sjc-clone-ecp-repo) "Clone ECP Repo" :color blue))
   "Branch"
   (("bs" (magit-branch) "Select Branch - Not Impl" :exit t)
    ("bm" (magit-main-branch) "Switch to Main" :exit t)
    ("bc" (magit-branch-create) "Create Branch Not Impl" :exit t))
   "Stage"
   (("s" (magit-stage-file (buffer-file-name)) "Stage File" :exit t)
    ("u" (magit-unstage-file (buffer-file-name)) "Unstage File" :exit t)
    ("a" (magit-stage-modified) "Stage Modified" :exit t))
   "Diff"
   (("df" (magit-diff-buffer-file) "Diff File" :exit t)
    ("ds" (magit-diff-staged) "Diff Staged" :exit t)
    ("du" (magit-diff-unstaged) "Diff Unstaged" :exit t))
   "Status"
   (("rp" (magit-project-status) "Project Status" :exit t))))

(define-key elfeed-show-mode-map "B" 'hydra-browse/body)

(provide 'setup-hydra)

;;; setup-hydra.el ends here
