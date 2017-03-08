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
(load-file "~/.emacs.d/helm.el")
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "78c1c89192e172436dbf892bd90562bc89e2cc3811b5f9506226e735a953a9c6" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (flycheck-color-mode-line helm-flycheck yasnippet yaml-mode web-mode scss-mode powerline-evil monokai-theme markdown-mode magit json-mode helm-projectile flycheck flx-ido evil-multiedit emmet-mode editorconfig company-tern better-defaults base16-theme alchemist))))

(set-face-attribute 'default nil :height 150)
(set-frame-font "Fira Code")

(provide 'init.el)
;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
