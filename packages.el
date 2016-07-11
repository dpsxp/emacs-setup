(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(defvar my-packages
  '(evil better-defaults js2-mode emmet-mode
         monokai-theme helm flycheck powerline-evil
         web-mode json-mode scss-mode magit ensime
         flx-ido company company-tern projectile 
         editorconfig ))

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

