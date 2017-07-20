;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x p") 'helm-projectile)

(provide 'bindings.el)
;;; bindings.el ends here
