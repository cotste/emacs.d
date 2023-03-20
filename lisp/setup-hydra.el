;;; Package: --- setup-hydra.el
;;; Commentary:

;;; Code:

(require 'custom-functions)

(use-package hydra
  :bind ("C-c b" . hydra-browse/body))

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

(pretty-hydra-define hydra-browse
  (:color red :title hydra--browse-title :quit-key "q")
  ("Browser"
   (("e" cotste/browse-url-with-eww "Browse with Eww" :exit t)
    ("d" cotste/browse-url-with-gui "Browse with Default" :exit t))))


(define-key elfeed-show-mode-map "B" 'hydra-browser/body)

(provide 'setup-hydra)

;;; setup-hydra.el ends here
