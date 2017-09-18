;;; config.el --- Package loaders

;;; Commentary:

;;; Code:
;;; Package configurations
(load-file "~/.emacs.d/packages.el")

;;; Default settings
(load-file "~/.emacs.d/defaults.el")
(load-file "~/.emacs.d/keyboards.el")
(load-file "~/.emacs.d/ui.el")

;;; Tools configurations
(load-file "~/.emacs.d/git.el")
(load-file "~/.emacs.d/find-file-in-project.el")

;;; Ivy configs
(load-file "~/.emacs.d/ivy-config.el")

;;; Helm configs
(load-file "~/.emacs.d/helm-config.el")


;;; Language configurations
(load-file "~/.emacs.d/elixir.el")
(load-file "~/.emacs.d/javascript.el")
(load-file "~/.emacs.d/css.el")

(provide 'config.el)
;;; config ends here
