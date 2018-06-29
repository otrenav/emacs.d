
(use-package google-c-style
  :ensure t
  :mode (("\\.java\\'" . java-mode))
  :init
  (add-hook 'c-mode-common-hook (lambda ()
                                  (subword-mode)
                                  (google-set-c-style)
                                  (google-make-newline-indent)
                                  (setq-default c-basic-offset 4)))
  :config
  (setq-default c-default-style '((java-mode . "k&r"))))


(provide 'setup-java)
