;;
;; .emacs for Emacs in /home/tiphaine
;; 
;; Made by Tiphaine
;; Login   <tiphaine.laurent@epitech.net>
;; 
;; Started on  Thu Sep 28 16:43:44 2017 Tiphaine
;; Last update Thu Sep 28 16:57:10 2017 Tiphaine
;;

;; Add .emacs.d to load path and remove the warning echo area from
;; the bottom of the screen
(add-to-list 'load-path "~/.emacs.d/")
(eval-after-load "warnings"
  '(setq display-warning-minimum-level :error))

;; Epitech header [C-c h]
;; Set user-custom-name if you want to specify a name for your header
(require 'std)
(require 'std_comment)

;; Column indicator (default 70) [f9]
(require 'fill-column-indicator)
(global-set-key (kbd "<f9>") 'fci-mode)
(setq fci-rule-column 70)

;; Auto-source for class headers [f7]
(require 'auto-source)

;; Auto-indent on save
;(add-hook 'before-save-hook 'c-indent-defun)

;; Pas d'intentation
(setq c-basic-offset 2			; Indent level after keyword (default: 2)
      c-indent-tabs-mode t		; Indent using tab (default: true)
      c-indent-level 8			; Tab length (default: 8)
      c-tab-always-indent t		; Tab always mean indent; use M-i to write tab (default: true)
      )

;; Affichage des lignes [f6]
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(global-set-key (kbd "<f6>") 'linum-mode)

;; Affiche les lignes et colonnes dans la barre du bas
(line-number-mode t)
(column-number-mode t)

;; Reduit ou developpe la fontion [home]
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key (kbd "<home>") 'hs-toggle-hiding)

;; Montre les parentheses
(show-paren-mode t)

;; Descent/monte la fenetre de 3 lines quand le curseur est au bout
(setq scroll-step 3)

;; Suppression des espaces en fin de ligne dans les fichiers C et C++
(add-hook 'c-mode-hook '(lambda ()(add-hook 'write-contents-hooks
					    'delete-trailing-whitespace nil t)))
(add-hook 'c++-mode-hook '(lambda () (add-hook 'write-contents-hooks
					       'delete-trailing-whitespace nil t)))
;; Suppression des espaces en fin de ligne lors de la sauvegarde
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Deplacement auto des fichier~ dans le dossier ~/.emacs.d/backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 5
      )

;; Auto-completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;; Config pour le web dev
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\."))
      )

;; C++ mode pour les fichiers .h ;; Disabled because of the use of hpp for C++
;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
