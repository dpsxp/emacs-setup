(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Uncomment to install all the packages used
;; (setq use-package-always-ensure t)

(provide 'packages)
;;; packages.el ends here
