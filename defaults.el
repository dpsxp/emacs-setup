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
    (ido-mode 1)
    (ido-everywhere 1)
  :config
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(use-package flx-ido
  :init
  (flx-ido-mode 1))

;;; editorconfig
(use-package editorconfig
  :init
  (editorconfig-mode 1))

(setq-default cursor-type '(hbar . 1))

(use-package company-mode
  :init
    (add-hook 'prog-mode-hook '(lambda() (company-mode 1))))

;;; Evil mode !!!
(use-package evil
  :init
  (evil-mode 1))

;;; Default theme
(use-package arjen-grey-theme
  :if window-system
  :init
  (load-theme 'arjen-grey t))

;;; Set PATH from shell
(use-package exec-path-from-shell
  :if window-system
  :config
    (exec-path-from-shell-initialize))
