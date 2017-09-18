;;; Package defaults

;;; Global modes
(add-hook 'prog-mode-hook '(lambda() (linum-mode 1)))
(add-hook 'before-save-hook '(lambda() (whitespace-cleanup)))

;;; Backup dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(use-package better-defaults)

(use-package ido
  :init
    (ido-mode t)
    (ido-everywhere t)
  :config
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package flx-ido
  :init
  (flx-ido-mode t))

;;; editorconfig
(use-package editorconfig
  :init
  (editorconfig-mode t))

(setq-default cursor-type '(hbar . 1))

(use-package company-mode
  :init
    (add-hook 'prog-mode-hook '(lambda() (company-mode 1))))

;;; Evil mode !!!
(use-package evil
  :init
  (evil-mode t))

;;; Set PATH from shell
(use-package exec-path-from-shell
  :if window-system
  :config
    (exec-path-from-shell-initialize))
