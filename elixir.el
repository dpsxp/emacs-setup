;;; Package elixir.el

;;; Commentary:
;;;
;;; Elixir configurations

;;; Code:

(require 'elixir-mode)

(defun dpaulino/elixir-tab-size ()
  "Set tab size for elixir files"
  (setq tab-width 2)
  (setq-default evil-shift-width 2))

(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-mode))
(add-to-list 'company-backends 'alchemist-company)
(add-hook 'elixir-mode-hook 'dpaulino/elixir-tab-size)
;;; elixir.el ends here
