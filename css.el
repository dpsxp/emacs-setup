;;; css.el --- Configs for CSS files and other style files

;;; Commentary:
;;;
;;; CSS configurations

;;; Code:

(require 'emmet-mode)

(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

(provide 'css)
;;; css.el ends here
