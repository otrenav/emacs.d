;;
;; - kill-rectangle    C-x r k
;; - yank-rectangle    C-x r y
;; - insert-rectangle  C-x r t
;; - delete-rectangle  C-x r d
;; - add number lines  C-x r N
;;

(bind-keys*
 ("M-p" . own/text/move-line-up)
 ("M-n" . own/text/move-line-down)
 ("C-d" . own/text/duplicate-current-line-or-region))

;;
;; Spell checking
;; --------------
;; - hunspell > aspell > ispell (program)
;; - ispell (command) checks manually
;; - flyspell checks interactively
;;
;; Requires:
;; - hunspell (sudo apt-get install hunspell)
;; - aspell   (sudo apt-get install aspell)
;;
;; Keybindings:
;; - Go to next flyspell error  C-,
;; - ispell current word        M-$
;;
(defun own/text/correct-next-word ()
  "Correct next word found with flyspell using ispell."
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))

(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "M-<f8>") 'own/text/correct-next-word)

;; (dolist (hook '(text-mode-hook))
;;   (add-hook hook (lambda ()
;;                    (flyspell-mode 1)
;;                    (global-unset-key (kbd "C-."))
;;                    (global-set-key (kbd "C-. C-g") magit-status))))

;; (dolist (hook '(prog-mode-hook R-mode-hook))
;;   (add-hook hook '(lambda ()
;;                     (flyspell-prog-mode)
;;                     (global-unset-key (kbd "C-."))
;;                     (global-set-key (kbd "C-. C-g") magit-status))))

;; Remove conflicting key for Git

(cond
 ((executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq-default ispell-local-dictionary "en_US")
  (setq-default ispell-local-dictionary-alist
                ;; You could use ("-d" "en_US,en_US-med")
                ;; to check with multiple dictionaries
                '(("en_US"
                   "[[:alpha:]]"
                   "[^[:alpha:]]"
                   "[']"
                   nil ("-d" "en_US") nil utf-8))))
 ((executable-find "aspell")
  (setq-default ispell-program-name "aspell")
  (setq-default ispell-extra-args '("--sug-mode=ultra"
                                    "--lang=en_US"
                                    "--run-together"
                                    "--run-together-limit=5"
                                    "--run-together-min=2"))))


(use-package whitespace
  :ensure t
  :defer 30
  :diminish (whitespace-mode
             global-whitespace-mode
             whitespace-newline-mode)
  :preface
  (dolist (hook '(ess-mode-hook
                  prog-mode-hook
                  text-mode-hook
                  conf-mode-hook))
    (add-hook hook #'whitespace-mode))
  :config
  (setq-default show-trailing-whitespace t)
  (setq-default whitespace-auto-cleanup t)
  (setq-default whitespace-line-column fill-column)
  (setq-default whitespace-rescan-timer-time nil)
  (setq-default whitespace-style '(tabs
                                   face
                                   tab-mark
                                   indentation
                                   trailing
                                   lines-tail)))


(use-package markdown-mode
  :ensure t
  :mode (("\\.md\\'"       . markdown-mode)
         ("\\.Rmd\\'"      . markdown-mode)
         ("\\.mdown\\'"    . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :preface
  (use-package pandoc-mode
    ;;
    ;; - PanDoc Menu  C-c \
    ;;
    :ensure t
    :bind(("C-c C-/" . pandoc-main-hydra/body)))
  (add-hook 'markdown-mode-hook #'pandoc-mode))


(use-package anzu
  :ensure t
  :diminish anzu-mode
  :bind (("M-%"   . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode 1))


(use-package text-mode
  :bind (:map text-mode-map
              ("C-j" . own/text/delete-indentation-forward)))


(use-package multi-line
  :bind ("M-j" . multi-line))


(defun own/text/duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated.
If there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))


(defun own/text/move-line-down ()
  "Move current line down and follow it."
  (interactive)
  (forward-line)
  (transpose-lines 1)
  (previous-line))


(defun own/text/move-line-up ()
  "Move current line up and follow it."
  (interactive)
  (forward-line)
  (transpose-lines -1)
  (previous-line))


(defun own/text/delete-indentation-forward ()
  (interactive)
  (delete-indentation t))

;; TODO: function to go from inline arguments to aligned downwards


(provide 'setup-text)
