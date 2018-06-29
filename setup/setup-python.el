;;
;; - Anaconda > Elpy,  Jedi.el
;; - Flake8   > PEP-8, Pyflakes
;; - Jedi     > Rope
;;
;; - Shift 4 spaces to the right  C-c >
;; - Shift 4 spaces to the left   C-c <
;;
;; Requirements:
;; - Jedi     sudo pip install jedi
;; - Radon    sudo pip install radon
;; - Flake8   sudo pip install flake8
;; - IPython  sudo pip install ipython
;;

(use-package python
  :ensure t
  :commands (run-python)
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (unbind-key "C-c c" python-mode-map)
  (setq python-shell-interpreter "ipython")
  (own/functions/deactivate-whitespace-checks   'inferior-python-mode-hook)
  (own/functions/previous-next-keybindings-repl 'inferior-python-mode-hook
                                                'inferior-python-mode-map))

(use-package anaconda-mode
  :ensure t
  :commands (anaconda-mode-find-references
             anaconda-mode-find-definitions
             anaconda-mode-find-assignments
             anaconda-mode-show-doc
             anaconda-mode-go-back)
  :init
  (defhydra hydra-python (global-map "C-. C-p")
    "Python"
    ("r" anaconda-mode-find-references  "References")
    ("d" anaconda-mode-find-definitions "Definitions")
    ("a" anaconda-mode-find-assignments "Assignments")
    ("o" anaconda-mode-show-doc         "Documentation")
    ("b" anaconda-mode-go-back          "Go back"))
  :config
  (anaconda-mode 1)
  (use-package company-anaconda
    :ensure t
    :demand
    :config
    (add-to-list 'company-backends 'company-anaconda)))


(use-package pytest
  :ensure t
  :bind (:map own/python/pytest-map
              ("o" . pytest-one)
              ("t" . pytest-all)
              ("m" . pytest-module)
              ("d" . pytest-directory)
              ("O" . pytest-pdb-one)
              ("T" . pytest-pdb-all)
              ("M" . pytest-pdb-module))
  :preface
  (defvar own/python/pytest-map)
  (define-prefix-command 'own/python/pytest-map)
  (bind-key "C-M-t" #'own/python/pytest-map))


(use-package virtualenvwrapper
  :ensure t
  :commands (venv-workon venv-deactivate)
  :config
  (venv-initialize-interactive-shells)
  (setq venv-location "~/Projects/system/python/envs/"))


(defun own/python/helper/score-data-django-shell ()
  (interactive)
  (venv-workon "score-data")
  (setq python-shell-interpreter-args
        (concat "-i /home/otrenav/Projects/datata/score-data/"
                "project/manage.py shell_plus"))
  (run-python)
  (split-window-right)
  (other-window 1)
  (switch-to-buffer (get-buffer-create "*Python*"))
  (setq python-shell-interpreter-args "-i"))


(provide 'setup-python)
