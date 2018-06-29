;;
;; - Eval the current value of a variable  C-h v <variable>
;;

(bind-key "C-c C-c" #'eval-buffer)
(bind-key "C-c C-r" #'eval-region)

(own/functions/rename-major-mode 'emacs-lisp-mode-hook "λ")
(add-to-list 'flycheck-disabled-checkers 'emacs-lisp-checkdoc)


(use-package parinfer
  :ensure t
  :bind (("C-. C-p" . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions '(defaults smart-tab smart-yank))
    (add-hook 'lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode))
  :config
  (setq parinfer-auto-switch-indent-mode-when-closing t))


(provide 'setup-lisp)
