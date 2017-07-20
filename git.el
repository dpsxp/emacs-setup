;;; git.el --- Keybindings and configs for magit

;;; Commentary:

;;; Code:

;;; Magit
(global-set-key (kbd "M-s") 'magit-status)
(global-set-key (kbd "M-a") 'magit-stage-file)
(global-set-key (kbd "M-c") 'magit-commit)
(global-set-key (kbd "M-p") 'magit-push-current-to-upstream)

(provide 'git.el)
;;; git.el ends here
