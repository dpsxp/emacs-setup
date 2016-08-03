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

(set-keyboard-coding-system 'utf-8)
(require 'powerline)
(powerline-default-theme)

;;; editoconfig
(require 'editorconfig)
(editorconfig-mode 1)

;;; Backup dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Global models
(add-hook 'prog-mode-hook '(lambda() (company-mode 1)))
(add-hook 'prog-mode-hook '(lambda() (linum-mode 1)))
(add-hook 'web-mode-hook '(lambda() (linum-mode 1)))

;;; Evil mode !!!
(add-hook 'emacs-startup-hook '(lambda() (evil-mode 1)))

;;; Default theme
(add-hook 'after-init-hook '(lambda() (load-theme 'base16-tomorrow-dark)))

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

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(global-set-key (kbd "C-x p") 'projectile-find-file)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;;; Evil multiedit
(require 'evil-multiedit)
(evil-multiedit-default-keybinds)

(provide 'init.el)
;;; init.el ends here
