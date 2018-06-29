
;; TODO: package to navigate parenthesis


(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :defines (yas-guessed-modes)
  :commands (yas-expand yas-minor-mode)
  :mode ("/\\.emacs\\.d/snippets/" . snippet-mode)
  :functions (yas-guess-snippet-directories yas-table-name)
  :bind (:map prog-mode-map
              ("C-. C-a TAB" . yas-expand)
              ("C-. C-a n"   . yas-new-snippet)
              ("C-. C-a s"   . yas-insert-snippet)
              ("C-. C-a v"   . yas-visit-snippet-file))
  :preface
  (defvar own/text/yasnippet-map)
  (define-prefix-command 'own/text/yasnippet-map)
  (bind-key "C-. C-a" #'own/text/yasnippet-map)
  :config
  (setq-default yas-indent-line (quote none))
  (setq-default yas-snippet-dirs '("~/.emacs.d/snippets/"))
  (setq-default yas-prompt-functions '(yas-x-prompt yas-dropdown-prompt))
  (yas-global-mode 1))


(use-package align
  :ensure t
  :commands align
  :bind (:map prog-mode-map
              ("C-<tab>"    . align-code)
              ("C-S-<stab>" . align-regexp))
  :preface
  (defun align-code (beg end &optional arg)
    (interactive "rP")
    (if (null arg)
        (align beg end)
      (let ((end-mark (copy-marker end)))
        (indent-region beg end-mark nil)
        (align beg end-mark)))))


(use-package highlight-symbol
  :ensure t
  :diminish highlight-symbol-mode
  :bind (:map prog-mode-map
              ("M-N" . highlight-symbol-next)
              ("M-P" . highlight-symbol-prev))
  :init
  (add-hook 'prog-mode-hook
            (lambda()
              (highlight-symbol-mode 1)
              (highlight-symbol-nav-mode 1)))
  :config
  (setq-default highlight-symbol-idle-delay 0.5))


(use-package expand-region
  :ensure t
  :bind (:map prog-mode-map
              ("C-M-f"      . er/mark-defun)
              ("C-="        . er/expand-region)
              ("C-<return>" . er/mark-symbol)))


(use-package company
  :ensure t
  :defer 10
  :commands company-mode
  :diminish company-mode
  :config
  (global-company-mode t)
  (setq-default company-idle-delay 0)
  (use-package company-quickhelp
    :ensure t
    :config
    ;; This colors crom from the ZeroDark theme
    (setq-default pos-tip-foreground-color "#abb2bf")
    (setq-default pos-tip-background-color "#282c34")
    (company-quickhelp-mode 1)))


(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml\\'" . yaml-mode))


(use-package ediff
  :ensure t
  :commands (ediff
             ediff-files
             ediff-buffers))


(use-package prog-mode
  :bind (:map prog-mode-map
              ("C-j" . own/text/delete-indentation-forward)))


(defun own/text/goto-line-with-numbers ()
  "Show line numbers while prompting for the line number."
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))
(global-set-key [remap goto-line] 'own/text/goto-line-with-numbers)


(defun own/text/toggle-camelcase-underscores ()
  "Toggle between CamelCase and under_score notation
for the symbol at point."
  (interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'symbol))
           (start (car bounds))
           (end (cdr bounds))
           (currently-using-underscores-p
            (progn (goto-char start (re-search-forward "_" end t)))))
      (if currently-using-underscores-p
          (progn
            (upcase-initials-region start end)
            (replace-string "_" "" nil start end)
            (downcase-region start (1+ start)))
        (replace-regexp "\\([A-Z]\\)" "_\\1" nil (1+ start) end)
        (downcase-region start
                         (cdr (bounds-of-thing-at-point 'symbol)))))))


(defun own/text/cleanup-buffer ()
  "Do things the right way. ;)"
  (interactive)
  (helper/whitespace-cleanup)
  (helper/untabify-buffer)
  (helper/indent-buffer)
  (helper/delete-empty-final-lines)
  (helper/make-standard-breaklines))


(defun helper/whitespace-cleanup ()
  (goto-char (point-min))
  (whitespace-cleanup)
  (delete-trailing-whitespace))


(defun helper/untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))


(defun helper/indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))


(defun helper/delete-empty-final-lines ()
  (goto-char (point-max))
  (delete-blank-lines))


(defun helper/make-standard-breaklines ()
  (set-buffer-file-coding-system 'unix)
  (goto-char (point-min))
  (while (re-search-forward "\r$" nil t)
    (replace-match ""))
  (set-buffer-file-coding-system 'utf-8))


(provide 'setup-programming)
