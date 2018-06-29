;;
;; Mac key configuration:
;; - Caps Lock => Control
;; - Command   => Meta
;; - Option    => Super
;; - Control   => Caps Lock
;;

(defconst own/mac/running-mac (eq system-type 'darwin))

(if own/mac/running-mac
    (progn
      (bind-key "M-q" 'kill-emacs)
      (setq mac-command-key-is-meta t)
      (setq ns-alternate-modifier nil)
      (setq mac-command-modifier 'meta)

      (use-package exec-path-from-shell
        :ensure t
        :defer 10
        :config
        (exec-path-from-shell-initialize)))

  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))


(provide 'setup-mac)
