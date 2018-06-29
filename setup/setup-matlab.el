
(use-package matlab-mode
  :ensure t
  :mode "\\.m\\'"
  :commands (matlab-shell matlab-mode)
  :preface
  (add-hook 'matlab-mode-hook
            (lambda () (setq visual-line-mode nil)))
  :config
  (setq-default matlab-fill-code t)
  (setq-default matlab-comment-anti-indent 0)
  (setq-default matlab-indent-function-body t)
  (setq-default matlab-do-functions-have-end t)
  (setq-default matlab-shell-command-switches
                (quote ("-nodesktop -nosplash"))))


(provide 'setup-matlab)
