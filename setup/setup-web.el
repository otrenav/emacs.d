;;
;; Dependencies:
;; - js-beautify  sudo npm install -g js-beautify
;; - jshint       sudo npm install -g jshint
;; - js-beautify  sudo npm install -g js-beautify
;;
;; Useful functions:
;; - httpd-start
;; - impatient-mode
;;
;; Impatient-mode:
;; 1. M-x httpd-start
;; 2. M-x impatient-mode
;; 3. Go to http://localhost:8080/imp
;;

(use-package web-mode
  :ensure t
  :mode "\\.html\\'"
  :config
  (setq-default web-mode-style-padding 4)
  (setq-default web-mode-block-padding 4)
  (setq-default web-mode-script-padding 4)
  (setq-default web-mode-css-indent-offset 4)
  (setq-default web-mode-code-indent-offset 4)
  (setq-default web-mode-enable-auto-pairing t)
  (setq-default web-mode-markup-indent-offset 4)
  (setq-default web-mode-enable-css-colorization t)
  (setq-default web-mode-enable-comment-keywords t)
  (setq-default web-mode-enable-current-column-highlight t)
  (setq-default web-mode-enable-current-element-highlight t)
  (setq-default web-mode-engines-alist '(("django" . "\\.html\\'")))
  (own/functions/before-save-hook 'html-mode-hook 'web-beautify-html)

  (use-package sgml-mode
    :ensure t
    :demand t
    :config
    (setq sgml-basic-offset 4)
    (defadvice sgml-delete-tag (after reindent-buffer activate)
      (my-cleanup-buffer))
    (defadvice sgml-close-tag (after close-tag-then-newline activate)
      (newline-and-indent))))


(use-package web-beautify
  ;;
  ;; - Hooks for this package are placed were
  ;;   appropiate `use-package` configurations
  ;;
  :ensure t
  :defer t
  :commands (web-beautify-js web-beautify-css web-beautify-html))


(use-package css-mode
  :mode "\\.css\\'"
  :config
  (own/functions/before-save-hook 'css-mode-hook 'web-beautify-css))


(use-package scss-mode
  :mode (("\\.sass\\'" . scss-mode)
         ("\\.scss\\'" . scss-mode))
  :config
  (own/functions/before-save-hook 'scss-mode-hook 'web-beautify-css))


(provide 'setup-web)
