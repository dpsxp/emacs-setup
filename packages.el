(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(defvar my-packages
  '(projectile evil better-defaults helm
         magit helm-projectile powerline-evil
         monokai-theme flycheck 
         emmet-mode flx-ido 
         web-mode json-mode scss-mode 
         company company-tern base16-theme
         editorconfig markdown-mode))

(defun prelude-packages ()
  (let ((all-packages 20))
    (dolist (p my-packages)
      (when (not (package-installed-p p))
        (setq all-packages nil)))
    all-packages))

(unless (prelude-packages)
  (package-refresh-contents)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

