(defun setup-ffi ()
  (setq ffip-prune-patterns '("*/.git/*" "*/node_modules/*" "**/dist/**" "**/coverage/**" "**/bower_components/**")))

(use-package helm-projectile
  :bind ("C-x p" . helm-projectile))

(use-package projectile
  :config
  (add-hook 'prog-mode-hook 'setup-ffi))
