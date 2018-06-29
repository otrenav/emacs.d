
(defun own/windows/three-even-windows ()
  "Create three horizontally evenly spaced windows."
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "<f6>") 'own/windows/three-even-windows)


(use-package ace-window
  :defer
  :ensure t
  :bind (("C-. C-." . ace-window)))


(use-package tabbar
  :defer
  :ensure t
  :bind (("S-<left>"  . tabbar-backward-tab)
         ("S-<right>" . tabbar-forward-tab))
  :config
  (defun user-emacs-tabbar-groups ()
    "Returns the name of the tab group names the current buffer belongs to.
There are two groups: Emacs buffers (those whose name starts with '*',
plus dired buffers), and the rest."
    (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
                ((eq major-mode 'dired-mode) "emacs")
                (t "user"))))
  (setq tabbar-buffer-groups-function 'user-emacs-tabbar-groups)
  (tabbar-mode))


(use-package neotree
  ;;
  ;; A        Maximize/minimize window
  ;; H        Toggle display hidden files
  ;; C-c C-n  Create a file or create a directory (if it ends with a ‘/’)
  ;; C-c C-d  Delete a file or a directory
  ;; C-c C-r  Rename a file or a directory
  ;; C-c C-c  Change the root directory
  ;;
  :ensure t
  :bind (("C-t" . neotree-toggle))
  :config
  (setq-default neo-smart-open t))


(provide 'setup-windows)
