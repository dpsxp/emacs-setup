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
(load-file "~/.emacs.d/git.el")
(load-file "~/.emacs.d/elixir.el")

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
(set-face-attribute 'default nil :height 160)
(set-frame-font "Monaco")

(provide 'init.el)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("83db918b06f0b1df1153f21c0d47250556c7ffb5b5e6906d21749f41737babb7" "a49760e39bd7d7876c94ee4bf483760e064002830a63e24c2842a536c6a52756" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default)))
 '(flycheck-javascript-flow-args nil)
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (alchemist web-mode scss-mode monokai-theme markdown-mode magit json-mode js2-refactor jasminejs-mode helm-projectile flycheck-flow flx-ido evil emmet-mode editorconfig company-tern company-flow better-defaults base16-theme arjen-grey-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
