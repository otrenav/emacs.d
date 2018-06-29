
(use-package ess
  :ensure t
  :commands R
  :mode (("\\.R\\'" . R-mode)
         ("\\.r\\'" . R-mode))
  :bind (:map ess-mode-map
              ("C-c C-r" . ess-eval-region)
              ("C-c C-c" . ess-eval-buffer)
              ("C-j"     . own/text/delete-indentation-forward))
  :init
  (setq-default ess-language "R")
  (setq-default ess-eval-visibly nil)
  (setq-default inferior-R-program-name "R")
  (setq-default ess-ask-for-ess-directory nil)
  :config
  (setq-default ess-smart-S-assign-key ";")
  (setq-default flycheck-lintr-linters
                (concat "with_defaults(line_length_linter(120), "
                        "absolute_paths_linter = NULL, "
                        "camel_case_linter = NULL, "
                        "snake_case_linter = NULL, "
                        "trailing_blank_lines_linter = NULL, "
                        "commented_code_linter = NULL)"))
  (own/functions/deactivate-whitespace-checks 'inferior-ess-mode-hook)
  (add-hook 'inferior-ess-mode-hook
            (lambda ()
               (define-key inferior-ess-mode-map [\M-up]
                 'comint-previous-matching-input-from-input)
               (define-key inferior-ess-mode-map [\M-down]
                 'comint-next-matching-input-from-input))))


(provide 'setup-r)
