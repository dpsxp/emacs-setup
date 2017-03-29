;;; package --- Summary

;;; Commentary:

;;; Emacs basic setup

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/javascript.el")
(load-file "~/.emacs.d/css.el")
(load-file "~/.emacs.d/find-file-in-project.el")
(load-file "~/.emacs.d/bindings.el")
(load-file "~/.emacs.d/defaults.el")
(load-file "~/.emacs.d/clipboard.el")

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
(set-face-attribute 'default nil :height 140)
(set-frame-font "Fira Code")

(provide 'init.el)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("db2ecce0600e3a5453532a89fc19b139664b4a3e7cbefce3aaf42b6d9b1d6214" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (yasnippet web-mode scss-mode rjsx-mode monokai-theme markdown-mode magit json-mode helm-projectile flycheck flx-ido evil emmet-mode editorconfig company-tern better-defaults arjen-grey-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
