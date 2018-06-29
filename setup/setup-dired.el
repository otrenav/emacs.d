
(use-package dired
  ;;
  ;; - Dired containing folder  C-x C-j
  ;; - Quit editing mode        C-c C-c
  ;;
  :demand
  :bind (:map dired-mode-map
              ("C-c C-e" . wdired-change-to-wdired-mode))
  :preface
  (use-package dired-single
    :ensure t
    :demand
    :preface
    (setq-default dired-single-use-magic-buffer t)

    (defun own/dired/up-directory ()
      (interactive)
      (dired-single-buffer ".."))

    (defun own/dired/init ()
      "Run for dired either immediately or when it's loaded."
      (define-key dired-mode-map [return] 'dired-single-buffer)
      (define-key dired-mode-map [mouse-1] 'dired-single-buffer-mouse)
      (define-key dired-mode-map (kbd "l")   'own/dired/up-directory)
      (define-key dired-mode-map (kbd "C-l") 'own/dired/up-directory))

    ;; If dired is loaded, keymap will be bounded
    (if (boundp 'dired-mode-map)
      (own/dired/init)
      (add-hook 'dired-load-hook 'own/dired/init)))

  (defun own/dired/switch-to-dired-buffer ()
    "Switch to the first Dired buffer found."
    (interactive)
    (let ((dired-buffers (cl-remove-if-not
                          (lambda (buffers)
                           (with-current-buffer buffers
                             (derived-mode-p 'dired-mode)))
                          (buffer-list))))
      (switch-to-buffer (car dired-buffers))))
  (key-seq-define-global ".d" 'own/dired/switch-to-dired-buffer)
  (add-hook 'dired-mode-hook (lambda () (whitespace-turn-off)))
  :config
  (global-auto-revert-mode 1)
  (setq-default dired-omit-files-p t)
  (use-package dired+
    :ensure t
    :demand
    :config
    (unbind-key "M-s f" dired-mode-map)))


(provide 'setup-dired)
