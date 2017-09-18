;;; ivy-config.el --- Ivy configurations

;;; Commentary:
;;;
;;; Config ivy and ivy integration packages

;;; Code:

(use-package counsel)

(use-package swiper)

(use-package ivy
  :bind
    ("\C-s" . swiper)
    ("C-c C-r" . ivy-resume)
    ("M-x" . counsel-M-x)
    ("C-x C-f" . counsel-find-file)
    ("C-c k" . counsel-ag)
    ("C-x l" . counsel-locate)
    ("C-r" . counsel-expression-history)
  :config
    (ivy-mode t)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t))

(provide 'ivy-confg)
;;; ivy-config.el ends here
