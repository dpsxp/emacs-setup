;;; javascript.el --- Configs for JS files and JSX files

;;; Commentary:
;;;
;;; Javascript configurations

;;; Code:

;;; Helper functions::
(defun use-eslint-from-node-modules ()
  "Helper to always get eslint per project."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun dpaulino/setup-js-mode ()
  "Better js2-mode options."
  ;;; Disable warnings leave it for flycheck
  (js2-mode-hide-warnings-and-errors)
  ;;; Add js2-refactor mode for nice refactoring
  (js2-refactor-mode))

(defun dpaulino/setup-jsx-mode ()
  "Make Emacs work better with JSX most ideas from spacemacs."
  ;;; Setups emmet mode
  (emmet-mode)
  (setq-local emmet-expand-jsx-className? t)
  ;;; Js Snippets
  (yas-activate-extra-mode 'js-mode)
  ;;; web-mode jsx
  (web-mode-set-content-type "jsx")
  ;;; tern-mode for autocomplete
  (tern-mode))

;;; Package declarations
(use-package company)

(use-package emmet-mode)

(use-package js2-refactor)

(use-package flycheck
  :ensure t
  :init
    (use-eslint-from-node-modules)
  :config
    (setq-default flycheck-temp-prefix ".flycheck")
    (add-hook 'prog-mode-hook 'global-flycheck-mode))

(use-package company-tern
  :defer t)

(use-package tern
  :init
    (add-to-list 'company-backends 'company-tern))

(use-package json-mode
  :mode "\\.json\\'")

(use-package web-mode
  :mode "\\.jsx\\'"
  :config
    (dpaulino/setup-jsx-mode))

(use-package js2-mode
  :mode "\\.js\\'"
  :config
    ;;; Use only ESlint as JS checker
    (setq-default flycheck-disabled-checkers
        (append flycheck-disabled-checkers '(javascript-jshint)))

    ;;; Flycheck config
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (dpaulino/setup-js-mode))

(provide 'javascript.el)
;;; javascript.el ends here
