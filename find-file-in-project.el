(defun setup-ffi ()
  (setq ffip-prune-patterns '("*/.git/*" "*/node_modules/*" "**/dist/**" "**/coverage/**" "**/bower_components/**")))

(use-package counsel-projectile
  :bind ("C-x p" . counsel-projectile))

(use-package projectile
  :config
  (add-hook 'prog-mode-hook 'setup-ffi))
