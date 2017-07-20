(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(defvar my-packages
  '(
    ;;; Defaults
    evil better-defaults helm flx-ido editorconfig
    ;;; Git
    magit
    ;;; Sintax and snippets
    flycheck yasnippet flycheck-flow
    ;;; Project
    helm-projectile projectile
    ;;; Modes
    emmet-mode web-mode json-mode
    scss-mode js2-mode js2-refactor
    jasminejs-mode markdown-mode
    ;;; Themes
    monokai-theme arjen-grey-theme base16-theme
    ;;; Autocompletes
    company company-tern company-flow
    ;;; Elixir
    alchemist))

(defun prelude-packages ()
  (let ((all-packages 30))
    (dolist (p my-packages)
      (when (not (package-installed-p p))
        (setq all-packages nil)))
    all-packages))

(unless (prelude-packages)
  (package-refresh-contents)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

