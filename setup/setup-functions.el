
(global-set-key (kbd "C-o") nil)
(global-set-key (kbd "C-d") nil)

(defvar own/functions/map)
(define-prefix-command 'own/functions/map)
(bind-key "C-. C-o" #'own/functions/map)
(bind-keys :prefix-map own/functions/map
           :prefix "C-. C-o"
           ("f" . find-file-at-point)
           ("o" . own/functions/open-with)
           ("k" . own/functions/delete-current-buffer-file)
           ("r" . own/functions/rename-current-buffer-file))


(defun own/functions/rename-major-mode (major-mode-hook-1 name-1)
  "Rename a major mode's mode-line string.
- HOOK is the name of the hook to use.
- NAME is the name that will be shown in the modeline."
  ;;
  ;; Note the use of the different technique with '`' and ',' to be able to use
  ;; the `name-1` variable inside the lambda function which would not be able to
  ;; see it otherwise.
  ;;
  (add-hook major-mode-hook-1 `(lambda () (setq mode-name ,name-1))))


(defun own/functions/deactivate-whitespace-checks (terminal-hook-1)
  "Deactivate whitespace checks. Normally used in terminals."
  (add-hook terminal-hook-1
            (lambda ()
              (flycheck-mode nil)
              (whitespace-mode nil)
              (setq show-trailing-whitespace nil))))


(defun own/functions/before-save-hook (major-mode-hook-2 function-to-apply)
  "Apply `function-to-apply` before saving on `major-mode`."
  '(add-hook major-mode-hook-2
             `(lambda ()
                (add-hook 'before-save-hook ,function-to-apply nil 'local))))


(defun own/functions/previous-next-keybindings-repl (terminal-hook-2 map)
  "Add keybindings for previous and next inside REPLs."
  (add-hook terminal-hook-2
            (lambda ()
              (define-key map [\M-down]
                'comint-next-matching-input-from-input)
              (define-key map [\M-up]
                'comint-previous-matching-input-from-input))))


(defun own/functions/open-with ()
  "Open current file with external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin) "open"
                      (read-shell-command "Open current file with: ")) " "
                      buffer-file-name))))


(defun own/functions/open-desktop-directory ()
  "Show current file in desktop (OS's file manager).
http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html"
  (interactive)
  (cond
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux") (shell-command "nautilus ."))))


(defun own/functions/delete-current-buffer-file ()
  "Delete the current buffer and the file connected with it."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (kill-buffer buffer)
      (when (yes-or-no-p "Are you sure, want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully deleted" filename)))))


(defun own/functions/rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message-box "File '%s' successfully renamed to '%s'"
                       name (file-name-nondirectory new-name)))))))


(defun own/text/syntax-color-hex ()
  "Syntax color hex values buffer."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdefABCDEF[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))

(add-hook 'prog-mode-hook 'own/text/syntax-color-hex)

;; (add-hook 'web-mode-hook        'own/text/syntax-color-hex)
;; (add-hook 'css-mode-hook        'own/text/syntax-color-hex)
;; (add-hook 'html-mode-hook       'own/text/syntax-color-hex)
;; (add-hook 'markdown-mode-hook   'own/text/syntax-color-hex)
;; (add-hook 'emacs-lisp-mode-hook 'own/text/syntax-color-hex)

(provide 'setup-functions)
