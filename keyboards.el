;;; keyboards.el --- Keyboard and enconding configuration

;;; Commentary:

;;; Code:

;;; Keyboard
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(setq default-input-method "latin-1-prefix")

(defun my-set-default-input-method ()
  (set-input-method 'latin-1-prefix))

(add-hook 'text-mode-hook 'my-set-default-input-method)
