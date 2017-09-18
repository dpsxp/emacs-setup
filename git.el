;;; git.el --- Keybindings and configs for magit

;;; Commentary:

;;; Code:

;;; Magit
(use-package magit
  :bind
  (
   ("M-s" . magit-status)
   ("M-a" . magit-stage-file)
   ("M-c" . magit-commit)
   ("M-p" . magit-push-current-to-upstream)))

(provide 'git.el)
;;; git.el ends here
