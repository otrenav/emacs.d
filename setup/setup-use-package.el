
;; Used for external binaries (e.g. linters)
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/setup")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(setq package-enable-at-startup nil)
(setq package-archives
      '(("gnu"   . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org"   . "http://orgmode.org/elpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-and-compile
  (defvar use-package-verbose t)
  (require 'cl)
  (require 'use-package)
  (require 'diminish))

(provide 'setup-use-package)
