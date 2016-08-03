;;; package --- Summary

;;; Commentary:

;;; Code:
(global-set-key (kbd "C-x p") 'projectile-find-file)

;;; Evil multiedit
(require 'evil-multiedit)
(evil-multiedit-default-keybinds)

;;; Magit
(global-set-key (kbd "M-s") 'magit-status)
(global-set-key (kbd "M-a") 'magit-stage-file)
(global-set-key (kbd "M-c") 'magit-commit)
(global-set-key (kbd "M-p") 'magit-push-current-to-upstream)

(provide 'bindings.el)
;;; bindings.el ends here
