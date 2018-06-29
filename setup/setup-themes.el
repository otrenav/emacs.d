
(if own/mac/running-mac
    (set-face-attribute 'default nil :font "Roboto Mono-18")
  (set-face-attribute 'default nil :font "Roboto Mono-16"))

;; (use-package zerodark-theme
;;   :ensure t
;;   :demand
;;   ;; :config
;;   (load-theme 'zerodark)
;;   )

;; (use-package solarized-theme
;;   :ensure t
;;   :demand
;;   ;; :config
;;   ;; (load-theme 'solarized-light t)
;;   ;; (load-theme 'solarized-dark t)
;;   )

;; (use-package subatomic-theme
;;   :ensure t
;;   :demand
;;   :config
;;   (load-theme 'subatomic t)
;;   )

;; (use-package base16-theme
;;   :ensure t
;;   :demand)

(use-package spacemacs-theme
  :ensure t
  :demand)

;;
;; The following is used to switch themes easily
;; https://github.com/habamax/.emacs.d/blob/
;; master/lisp/haba-appearance.el
;;
(defvar own/theme/one 'spacemacs-light)
(defvar own/theme/two 'spacemacs-dark)
(defvar own/theme/current own/theme/one)

(load-theme own/theme/current t)

(defun own/theme/toggle ()
  (interactive)
  (cond ((eq own/theme/current own/theme/one) (own/theme/next own/theme/two))
        ((eq own/theme/current own/theme/two) (own/theme/next own/theme/one))))

(global-set-key (kbd "<f7>") 'own/theme/toggle)

(defun own/theme/disable-all-themes (&rest args)
  (mapcar #'disable-theme custom-enabled-themes))
(advice-add 'load-theme :before #'own/theme/disable-all-themes)

(defun own/theme/next (theme)
  (load-theme theme t)
  (setq own/theme/current theme))

(provide 'setup-themes)
