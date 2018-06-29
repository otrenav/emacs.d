
(use-package auctex-latexmk
  ;;
  ;; - Compile  C-c C-c
  ;; - View     C-c C-c
  ;;
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :init
  (add-hook 'latex-mode-hook 'turn-on-reftex)
  (add-hook 'latex-mode-hook 'latex-math-mode)
  (add-hook 'latex-mode-hook 'visual-line-mode)
  (add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
  :config
  (auctex-latexmk-setup)
  (setq-default tex-pdf-mode t)
  (setq-default tex-master nil)
  (setq-default tex-auto-save t)
  (setq-default tex-parse-self t)
  (setq-default tex-save-query nil)
  (setq-default reftex-plug-into-AUCTeX t)
  (setq-default tex-electric-sub-and-superscript t)
  (use-package latex-pretty-symbols :demand :ensure t))


(provide 'setup-latex)
