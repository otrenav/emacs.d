
(require 'org)
(require 'ox-beamer)

;; Ensure this loads after theme
(load-theme 'org-beautify t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (scheme . t)
   (ruby . t)
   (sh . t)
   (R . t)))

(setq org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "DONE")))
(setq org-return-follows-link t)

(use-package org-bullets
  :ensure t
  :demand
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))


(provide 'setup-org)
