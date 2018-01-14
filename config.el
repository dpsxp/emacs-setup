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
;;; (load-file "~/.emacs.d/helm-config.el")

(defun dpaulino/should-load (exs)
  (seq-find
    '(lambda (ext)
      (and buffer-file-name (string-equal (file-name-extension buffer-file-name) ext)))
    exs))

(defun dpaulino/extension-loading ()
  ;;; Language configurations
  (if (dpaulino/should-load '("exs" "ex"))
    (load-file "~/.emacs.d/elixir.el"))

  (if (dpaulino/should-load '("js" "jsx"))
    (load-file "~/.emacs.d/javascript.el"))

  (if (dpaulino/should-load '("css" "scss"))
    (load-file "~/.emacs.d/css.el")))

(add-hook 'change-major-mode-hook 'dpaulino/extension-loading)

(provide 'config.el)
;;; config ends here
