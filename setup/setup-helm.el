
(use-package helm
  ;;
  ;; - helm-ff-run-grep     C-s (pre C-u: recursive)
  ;; - helm-google-suggest  C-c h C-c g
  ;; - helm-info-at-point   C-c h h i
  ;; - helm-regex           C-c h r
  ;;
  ;; Search symbols:
  ;; *!lisp,!sh,!fun:   all buffers but the ones in lisp-mode, sh-mode and
  ;;                    fundamental-mode
  ;; *lisp ^helm @moc:  lisp mode buffers starting by "helm" and match
  ;;                    "moc" in their contents
  ;; *lisp ^helm moc:   lisp mode buffers starting by "helm" and have "moc"
  ;;                    in their name
  ;; *!lisp !helm:      buffers that are not in "lisp" mode and that do not
  ;;                    match "helm"
  ;; /helm/ w3:         buffers that are in any "helm" sub-directory and
  ;;                    match w3
  ;;
  :ensure t
  :diminish helm-mode
  :bind (("M-x"     . helm-M-x)
         ("C-s"     . helm-occur)
         ("M-H"     . helm-resume)
         ("C-h a"   . helm-apropos)
         ("C-h i"   . helm-info-emacs)
         ("C-x C-f" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ("C-c h"   . helm-command-prefix)
         ("M-y"     . helm-show-kill-ring))
  :init
  ;; Requires `key-chord` to be already loaded
  (key-seq-define-global "xx" 'helm-M-x)
  (key-seq-define-global "jf" 'helm-find-files)
  (key-seq-define-global "vb" 'helm-buffers-list)
  (key-seq-define-global "jg" 'helm-browse-project)
  (key-seq-define-global ".a" 'helm-filtered-bookmarks)
  :config
  (require 'helm-config)
  (ido-mode -1)
  (helm-mode 1)
  (add-to-list 'helm-sources-using-default-as-input
               'helm-source-man-pages)
  (setq-default helm-autoresize-mode t)
  (setq-default helm-M-x-fuzzy-match t)
  (setq-default helm-yank-symbol-first t)
  (setq-default helm-imenu-fuzzy-match t)
  (setq-default helm-apropos-fuzzy-match t)
  (setq-default helm-recentf-fuzzy-match t)
  (setq-default helm-semantic-fuzzy-match t)
  (setq-default helm-buffers-fuzzy-matching t)
  (setq-default helm-split-window-in-side-p t)
  (setq-default helm-ff-search-library-in-sexp t)
  (setq-default helm-yas-display-key-on-candidate t)
  (setq-default helm-move-to-line-cycle-in-source nil)
  (setq-default helm-ff-file-name-history-use-recentf t)
  (setq-default helm-ff-transformer-show-only-basename nil))


(use-package helm-swoop
  ;;
  ;; - Go into edit mode  C-c C-e
  ;;
  :ensure t
  :bind (("M-i"     . helm-swoop)
         ("C-. M-i" . helm-multi-swoop)
         ("C-. M-I" . helm-multi-swoop-all)
         ("M-I"     . helm-swoop-back-to-last-point)
         ("C-. C-i" . helm-multi-swoop-current-mode))
  :config
  (setq-default helm-multi-swoop-edit-save t)
  (setq-default helm-swoop-move-to-line-cycle nil)
  (setq-default helm-swoop-split-with-multiple-windows t)
  (setq-default helm-swoop-split-direction 'split-window-vertically))


(use-package helm-descbinds
  :ensure t
  :bind (("C-h b" . helm-descbinds)))


(use-package helm-ls-git
  ;;
  ;; Replaces `helm-browse-project`
  ;;
  :ensure t
  :defer t)


(provide 'setup-helm)
