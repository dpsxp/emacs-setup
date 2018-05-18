;;; ui.el --- UI configurations

;;; Commentary:

;;; Code:
;;; Default theme
(use-package doom-themes
  :if window-system
  :init
  (load-theme 'doom-tomorrow-night t))

(use-package dracula-theme
   :if (not (window-system))
   :init
   (load-theme 'dracula t))

(use-package emojify
  :if window-system
  :init
  (global-emojify-mode))

;;; Default font
(set-face-attribute 'default nil :height 160)
(set-frame-font "Hack")

(provide 'ui.el)
;;; ui ends here
