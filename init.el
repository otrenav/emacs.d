
;; (setq debug-on-error t)

(package-initialize)
(load "~/.emacs.d/setup/setup-use-package.el")

;; Ordered
(require 'setup-mac)
(require 'setup-text)
(require 'setup-themes)
(require 'setup-flycheck)
(require 'setup-functions)
(require 'setup-programming)
(require 'setup-keybindings)

;; Unordered
(require 'setup-r)
(require 'setup-git)
(require 'setup-web)
(require 'setup-helm)
(require 'setup-lisp)
(require 'setup-dired)
(require 'setup-python)
(require 'setup-windows)
(require 'setup-settings)
(require 'setup-javascript)

;;
;; Non-essential
;; (require 'setup-java)
;; (require 'setup-latex)
;; (require 'setup-org)
;; (require 'setup-matlab)
;; (require 'setup-julia)
;; (require 'setup-terminal)
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#E8E8E8" "#3C3C3C" "#616161" "#0E0E0E" "#252525" "#3C3C3C" "#171717" "#0E0E0E"])
 '(ansi-term-color-vector
   [unspecified "#f7f9fb" "#bf8b56" "#56bf8b" "#8bbf56" "#8b56bf" "#bf568b" "#8b56bf" "#405c79"])
 '(custom-safe-themes
   (quote
    ("0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "dacce23bc9bace2248ebbd89756fd74f213c754b7b022fa3f090e220faf1a813" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "e04cdda50908b116031c09d7b316fff5d8f9bc6e2126411c9316969461bfd8b6" "92192ea8f0bf04421f5b245d906701abaa7bb3b0d2b3b14fca2ee5ebb1da38d8" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(fci-rule-color "#F1F1F1")
 '(package-selected-packages
   (quote
    (tao-theme spacemacs-theme zerodark-theme yasnippet yaml-mode web-mode web-beautify virtualenvwrapper use-package typescript-mode tabbar subatomic-theme solarized-theme rainbow-delimiters pytest parinfer pandoc-mode org-bullets neotree multiple-cursors multi-line matlab-mode material-theme markdown-mode latex-pretty-symbols key-seq json-mode js2-mode highlight-symbol hemisu-theme helm-swoop helm-ls-git helm-descbinds guide-key google-c-style github-theme git-gutter expand-region ess emmet-mode dracula-theme dired-single dired+ company-quickhelp company-anaconda challenger-deep-theme base16-theme auctex-latexmk atom-one-dark-theme anzu ace-window)))
 '(vc-annotate-background "#F6F6F6")
 '(vc-annotate-color-map
   (quote
    ((20 . "#C3C3C3")
     (40 . "#9E9E9E")
     (60 . "#9E9E9E")
     (80 . "#616161")
     (100 . "#616161")
     (120 . "#3C3C3C")
     (140 . "#3C3C3C")
     (160 . "#252525")
     (180 . "#252525")
     (200 . "#252525")
     (220 . "#171717")
     (240 . "#171717")
     (260 . "#171717")
     (280 . "#0E0E0E")
     (300 . "#0E0E0E")
     (320 . "#0E0E0E")
     (340 . "#090909")
     (360 . "#090909"))))
 '(vc-annotate-very-old-color "#3C3C3C"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
