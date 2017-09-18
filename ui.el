;;; ui.el --- UI configurations

;;; Commentary:

;;; Code:
;;; Default theme
(use-package doom-themes
  :if window-system
  :init
  (load-theme 'doom-tomorrow-night t))

;;; Default font
(set-face-attribute 'default nil :height 160)
(set-frame-font "Ubuntu Mono")


(provide 'ui.el)
;;; ui ends here
