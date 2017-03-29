;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Magit
(global-set-key (kbd "M-s") 'magit-status)
(global-set-key (kbd "M-a") 'magit-stage-file)
(global-set-key (kbd "M-c") 'magit-commit)
(global-set-key (kbd "M-p") 'magit-push-current-to-upstream)


;;; Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x p") 'helm-projectile)

(provide 'bindings.el)
;;; bindings.el ends here
