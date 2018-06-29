
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :preface
  (own/functions/rename-major-mode 'js2-mode-hook "JS")
  :config
  (own/functions/before-save-hook 'js2-mode-hook 'web-beautify-js)
  (setq-default js-indent-level 4)
  (setq-default js2-indent-level 4)
  (setq-default js2-basic-offset 4)
  (setq-default js2-highlight-level 3)
  (setq-default js2-indent-switch-body t)
  (setq-default javascript-indent-level 4)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode))
  ;; (add-to-list 'flycheck-disabled-checkers 'javascript-jshint))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :preface
  (own/functions/rename-major-mode 'typescript-mode-hook "TS")
  :config
  (own/functions/before-save-hook 'typescript-mode-hook 'web-beautify-js)
  (setq-default typescript-indent-level 4))


(use-package json-mode
  :ensure t
  :mode "\\.json\\'"
  :config
  (own/functions/before-save-hook 'json-mode-hook 'web-beautify-js)
  (setq-default js-indent-level 4))


(provide 'setup-javascript)
