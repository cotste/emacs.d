;;; Package: --- setup-hydra.el
;;; Commentary:

;;; Code:

(require 'custom-functions)



(use-package posframe :ensure t)

(use-package pretty-hydra :ensure t)

(elpaca major-mode-hydra)

(use-package hydra
   :ensure t
   :bind
   ("C-c b" . hydra-browse/body)
   ("C-c n" . hydra-note/body)
   ("C-c t" . hydra-time/body)
   ("C-c e" . hydra-config/body)
   ("C-c f" . hydra-fonts/body)
;;   ("C-c m" . hydra-magit/body)
   :config

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
  (:color pink :title hydra--fonts-title :quit-key "q")
  ("Font Size"
   (("b" (zuco/scale-up-fonts) "Scale fonts to 130" :exit t)
    ("s" (zuco/scale-down-fonts) "Scale fonts to 110" :exit t)
    ("u" (zuco/scale-fonts-inc) "Scale fonts up by 5")
    ("d" (zuco/scale-fonts-dec) "Scale fonts down by 5"))))

(pretty-hydra-define hydra-note
  (:title hydra--note-title :quit-key "q")
  ("Denote"
   (("n" denote "New Denote" :exit t)
    ("t" denote-type "New Denote - Type" :exit t)
    ("r" denote-rename-file "Rename to Denote" :exit t)
    ("s" sjc-select-denote-silo "Select Denote Silo" :exit t))
   "Notes"
   (("d" (dired "~/notes") "Denote Directory" :exit t)
    ("f" sjc-denote-regex-search "Search Notes (text)" :exit t))
   "Journal"
   (("e" sjc/list-diary-notes "Journal Notes" :exit t)
    ("j" sjc/new-diary-note "Create Diary" :exit t))
   "Links"
   (("F" denote-link-find-file "Open Denote Link" :exit t))))

(pretty-hydra-define hydra-time
  (:title hydra--time-title :quit-key "q")
  ("Time Clock"
   (("i" (org-clock-in) "Clock In" :exit t)
    ("s" (org-clock-select-task) "Select Task" :exit t)
    ("o" org-clock-out "Clock Out" :exit t)
    ("g" org-clock-goto "Goto Current Clock" :exit t)
    ("t" (find-file "~/notes/expd/gtd/clocktable.org") "Open Time Sheet" :exit t))
   "Dates"
   (("C" calendar "Open Calendar" :exit t)
    ("D" org-deadline "Set Deadline" :exit t)
    ("S" org-schedule "Set Schedule" :exit t))))

(pretty-hydra-define hydra-config
  (:title hydra--emacs-title :quit-key "q")
  ("Init"
   (("e" (find-file "~/.config/emacs/init.el") "Edit Init" :exit t)
    ("o" (dired "~/.config/emacs") "Open Config Dir" :exit t)
    ("l" (dired "~/.config/emacs/lisp") "Open Lisp Dir" :exit t)
    ("f" (consult-find "~/.config/emacs") "Search for file" :exit t))
   "Git"
   (("m" (magit-status "~/.emacs.d") "Magit" :exit t))))

;;Hydra for general Magit tasks
(pretty-hydra-define hydra-magit
  (:title hydra--magit-title :quit-key "q")
  ("Clone"
   (("cc" (magit-clone) "Clone Repo" :exit t)
    ("ce" (zuco/clone-ecp-repo) "Clone ECP Repo" :color blue)
    ("cs" (zuco/clone-ecp-service-repo) "Clone ECP Service Repo" :color blue))
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

(define-key elfeed-show-mode-map "B" 'hydra-browse/body))

(use-package hydra-posframe
  :ensure (:type git :host github :repo "ladicle/hydra-posframe")
  :config (setq hydra-posframe-parameters '((right-fringe . 20) (left-fringe . 5)))
  :hook (elpaca-after-init . hydra-posframe-mode))

(provide 'setup-hydra)

;;; setup-hydra.el ends here
