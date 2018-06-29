
(setq-default tab-width 4)
(setq-default fill-column 80)
(setq-default visible-bell t)
(setq-default truncate-lines t)
(setq-default use-dialog-box nil)
(setq-default indent-tabs-mode nil)
(setq-default inhibit-splash-screen t)
(setq-default inhibit-startup-message t)
(setq-default select-enable-clipboard t)
(setq-default ring-bell-function 'ignore)
(setq-default initial-scratch-message nil)
(setq-default initial-major-mode 'org-mode)
(setq-default auto-fill-function 'do-auto-fill)

(tool-bar-mode -1)
(show-paren-mode t)
(scroll-bar-mode -1)
(blink-cursor-mode t)
(global-linum-mode 0)
(global-hl-line-mode 0)
(transient-mark-mode t)
(delete-selection-mode t)
(prefer-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Backups
(defvar backup-dir (expand-file-name "~/.emacs.d/backups/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/backups/"))
(setq-default backup-directory-alist (list (cons ".*" backup-dir)))
(setq-default auto-save-file-name-transforms `((".*" ,autosave-dir t)))
(setq-default auto-save-list-file-prefix autosave-dir)

;; Autorevert, update files when changed on disk
(setq-default global-auto-revert-non-file-buffers t)
(setq-default auto-revert-verbose nil)
(diminish 'auto-revert-mode)

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'setup-settings)
