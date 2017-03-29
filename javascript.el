;;; Flycheck
(require 'flycheck)

;; Eslint config
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(setq-default flycheck-temp-prefix ".flycheck")

;;; Helper to always get eslint per project
(defun use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook 'use-eslint-from-node-modules)

;;; Flycheck mode
(add-hook 'after-init-hook 'global-flycheck-mode)

;;; JS Modes
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

;;; TernJS
(require 'company)
(add-hook 'rjsx-mode-hook (lambda () (tern-mode t)))
(add-hook 'rjsx-mode-hook (lambda () (js2-mode-hide-warnings-and-errors)))
(add-to-list 'company-backends 'company-tern)
