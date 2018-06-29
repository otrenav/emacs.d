;;
;; start recording macro    C-( (F2)
;; stop recording macro     C-) (F3)
;; play back macro once     C-e (F4)
;; play back until fail     C-u 0 C-e
;; Edit a file with sudo    C-x C-f /sudo::/etc/file
;; exchange-point-and-mark  C-x C-x
;; repeat last command      C-x z
;;

(bind-key "C-x C-n" #'next-line)
(bind-key "C-S-s" #'isearch-forward)
(bind-key "C-+" #'text-scale-increase)
(bind-key "C--" #'text-scale-decrease)

(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")
(global-unset-key "\C-x\C-c")
(global-set-key (kbd "C-o") nil)
(global-set-key (kbd "C-x C-h") nil)
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)
(substitute-key-definition 'kill-buffer 'kill-this-buffer global-map)


(use-package key-chord
  :ensure t
  :demand
  :config
  (key-chord-mode 1)
  (use-package avy
    :ensure t
    :commands avy-goto-char)
  (use-package key-seq
    ;;
    ;; - Requires `key-chord` to be loaded
    ;; - Is required by other packages in my setup
    ;;
    :ensure t
    :demand
    :config
    (key-seq-define-global ".w" 'other-frame)
    (key-seq-define-global "kk" 'avy-goto-char)
    (key-seq-define-global "ww" 'delete-window)
    (key-seq-define-global "bb" 'mode-line-other-buffer)))


(use-package guide-key
  ;;
  ;; Pop-up with possible keybinding completions
  ;;
  :defer 10
  :ensure t
  :diminish guide-key-mode
  :commands guide-key-mode
  :config
  (setq guide-key/idle-delay 1)
  (setq guide-key/guide-key-sequence t)
  (setq guide-key/popup-window-position 'bottom)
  (guide-key-mode 1))


(use-package hydra :defer t :ensure t)


(provide 'setup-keybindings)
