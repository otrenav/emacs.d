;;
;; C-c C-j  Line mode
;; C-c C-k  Char mode
;;

(own/functions/deactivate-whitespace-checks 'term-mode-hook)


;; Use updated bash versions
(if (eq system-type 'darwin)
    (progn
      (setq-default multi-term-program "/usr/local/bin/bash")
      (setq-default explicit-shell-file-name "/usr/local/bin/bash"))
  (setq-default multi-term-program "/bin/bash")
  (setq-default explicit-shell-file-name "/bin/bash"))


(defun own/terminal/remove-frame-from-exited-terminal ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (kill-buffer ,buff))))))

(add-hook 'term-exec-hook 'own/terminal/remove-frame-from-exited-terminal)


;; Use UTF-8 in the terminal
(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)


(provide 'setup-terminal)
