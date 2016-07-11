(defun setup-ffi ()
  (setq ffip-prune-patterns '("*/.git/*" "*/node_modules/*" "**/dist/**" "**/coverage/**" "**/bower_components/**")))

(add-hook 'prog-mode-hook 'setup-ffi)
