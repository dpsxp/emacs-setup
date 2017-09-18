;;; css.el --- Configs for CSS files and other style files

;;; Commentary:
;;;
;;; CSS configurations

;;; Code:

(use-package emmet)

(use-package scss-mode
  :mode "\\.scss\\'"
  :config
    (add-hook 'css-mode-hook 'emmet-mode)
    (add-hook 'sgml-mode-hook 'emmet-mode))

(provide 'css)
;;; css.el ends here
