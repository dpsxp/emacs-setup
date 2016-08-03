;;; package --- Summary

;;; Commentary:

;;; Emacs basic setup

;;; Code:
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/helm.el")
(load-file "~/.emacs.d/javascript.el")
(load-file "~/.emacs.d/css.el")
(load-file "~/.emacs.d/find-file-in-project.el")
(load-file "~/.emacs.d/bindings.el")
(load-file "~/.emacs.d/defaults.el")

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("b6db49cec08652adf1ff2341ce32c7303be313b0de38c621676122f255ee46db" "c567c85efdb584afa78a1e45a6ca475f5b55f642dfcd6277050043a568d1ac6f" default)))
 '(inhibit-startup-screen t))

(provide 'init.el)
;;; init.el ends here
