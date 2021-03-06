;;; css.el --- Configs for CSS files and other style files

;;; Commentary:
;;;
;;; CSS configurations

;;; Code:

(use-package emmet-mode
  :config
    (add-hook 'css-mode-hook 'emmet-mode)
    (add-hook 'sgml-mode-hook 'emmet-mode))

(use-package scss-mode
  :mode "\\.scss\\'")

(provide 'css)
;;; css.el ends here
