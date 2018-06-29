;;
;; - Flycheck > Flymake
;;
;; - CSSLint  (CSS)          sudo npm install -g csslint
;; - Tidy     (HTML)         sudo apt-get install tidy
;;                           brew install tidy-html5
;; - ESLint   (JavaScript)   sudo npm install -g eslint
;; - JSONLint (JSON)         sudo npm install -g jsonlint
;; - Flake8   (Python)       sudo pip install flake8
;; - Pylint   (Python)       sudo apt-get install pylint
;;

(use-package flycheck
  :defer t
  :ensure t
  :commands (flycheck-add-mode)
  :preface
  (setq flycheck-disabled-checkers nil)
  (message "**********************")
  (message flycheck-disabled-checkers)
  (message "**********************")
  :config
  (global-flycheck-mode)
  (global-set-key
   (kbd "C-. C-f")
   (defhydra hydra-flycheck
     (:body-pre ())
     "Flycheck"
     ("l" flycheck-list-errors "List")
     ("n" flycheck-next-error "Next")
     ("p" flycheck-previous-error "Previous")
     ("v" flycheck-verify-setup "Verify")
     ("s" flycheck-select-checker "Syntax")
     ("x" flycheck-disable-checker "Disable")
     ("d" flycheck-describe-checker "Describe")
     ("e" flycheck-set-checker-executable "Select")
     ("h" flycheck-display-error-at-point "Info on error"))))


(provide 'setup-flycheck)
