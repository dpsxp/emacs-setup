;;; Package elixir.el

;;; Commentary:
;;;
;;; Elixir configurations

;;; Code:

(defun dpaulino/elixir-tab-size ()
  "Set tab size for elixir files"
  (setq tab-width 2)
  (setq-default evil-shift-width 2))

(use-package alchemist
  :interpreter "elixir")

(use-package elixir-mode
  :interpreter "elixir"
  :config
    (dpaulino/elixir-tab-size)
    (add-to-list 'company-backends 'alchemist-company))

(provide 'elixir.el)
;;; elixir.el ends here
