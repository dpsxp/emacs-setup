;;; Flycheck
(require 'flycheck)

;; Eslint config
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'js2-mode)
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
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))

;;; TernJS
(require 'company)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-to-list 'company-backends 'company-tern)

;;; JSDoc
(require 'js-doc)
(add-hook 'js2-mode-hook
          (lambda ()
            (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
            (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(require 'babel-repl)
(setq babel-repl-cli-program "babel-repl")

(require 'comint)
(add-to-list 'comint-preoutput-filter-functions
             (lambda (output)
               (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))
