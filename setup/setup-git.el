
(defvar own/git/map)
(define-prefix-command 'own/git/map)
(bind-key "C-. g" #'own/git/map)


(use-package magit
  :ensure t
  :bind (("C-. C-g". magit-status))
  :init
  (add-hook 'magit-mode-hook 'hl-line-mode)
  :config
  (magit-auto-revert-mode t)
  (unbind-key "M-h" magit-mode-map)
  (unbind-key "M-s" magit-mode-map)
  (unbind-key "M-m" magit-mode-map)
  (unbind-key "M-w" magit-mode-map))


(use-package git-gutter
  :defer 60
  :ensure t
  :diminish git-gutter-mode
  :bind (("C-. g t" . git-gutter-mode)
         ("C-. g d" . git-gutter:popup-hunk)
         ("C-. g p" . git-gutter:previous-hunk)
         ("C-. g n" . git-gutter:next-hunk)
         ("C-. g r" . git-gutter:revert-hunk))
  :config
  (global-git-gutter-mode t))


;; Don't bother me
(setq vc-follow-symlinks t)
(setq vc-handled-backends ())


(provide 'setup-git)
