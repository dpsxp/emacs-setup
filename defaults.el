;;; Package defaults
(set-keyboard-coding-system 'utf-8)

(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)

;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)

;;; editorconfig
(require 'editorconfig)
(editorconfig-mode 1)

;;; Backup dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Global modes
(add-hook 'prog-mode-hook '(lambda() (company-mode 1)))
(add-hook 'prog-mode-hook '(lambda() (linum-mode 1)))
(add-hook 'web-mode-hook '(lambda() (linum-mode 1)))

;;; Evil mode !!!
(add-hook 'emacs-startup-hook '(lambda() (evil-mode 1)))

;;; Default theme
(if (display-graphic-p)
  (load-theme 'base16-tomorrow-night t)
    (load-theme 'monokai t))

(setq-default cursor-type '(hbar . 1))

;;; Keyboards
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-input-method "latin-1-prefix")
(defun my-set-default-input-method ()
  (set-input-method 'latin-1-prefix))
(add-hook 'text-mode-hook 'my-set-default-input-method)

;;; Magithub
(use-package magithub
  :after magit
  :config (magithub-feature-autoinject t))
