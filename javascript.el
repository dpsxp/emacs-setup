;;; javascript.el --- Configs for JS files and JSX files

;;; Commentary:
;;;
;;; Javascript configurations

;;; Code:

(require 'flycheck)
(require 'web-mode)
(require 'flycheck-flow)
(require 'company)
(require 'emmet-mode)
(require 'js2-mode)
(require 'yasnippet)
(require 'jasminejs-mode)

;; Use only ESlint as JS checker
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers '(javascript-jshint)))

;;; Flycheck config
(setq-default flycheck-temp-prefix ".flycheck")
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-flow 'web-mode)
(flycheck-add-mode 'javascript-flow-coverage 'web-mode)
(flycheck-add-next-checker 'javascript-flow 'javascript-flow-coverage)

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

(defun dpaulino/setup-jasmine-mode ()
  "Setup jasmine mode for better test files."
  (jasminejs-add-snippets-to-yas-snippet-dirs))

;;; Configure ESlint for projects
(add-hook 'flycheck-mode-hook 'use-eslint-from-node-modules)

;;; Flycheck mode
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'jasminejs-mode-hook 'dpaulino/setup-jasmine-mode)
(add-hook 'js2-mode-hook 'dpaulino/setup-js-mode)
(add-hook 'web-mode-hook 'dpaulino/setup-jsx-mode)

;;; JS Modes hooks
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

;;; JS autocompletes
(add-to-list 'company-backends 'company-tern)
(add-to-list 'company-backends 'company-flow)

(provide 'javascript.el)
;;; javascript.el ends here
