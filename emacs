;;
;; .emacs for emacs_config in /home/tiphaine
;; 
;; Made by Clement DUGAL
;; Login   <dugal_c@epitech.net>
;; 
;; Started on  Thu Mar 13 17:37:11 2014 Clement DUGAL
;; Last update Fri Sep 22 10:55:23 2017 Tiphaine
;;

;; DO NOT DELETE
(eval-after-load "warnings"
  '(setq display-warning-minimum-level :error))
(load "std.el")
(load "std_comment.el")
(add-to-list 'load-path "~/.emacs.d/")

;; Affichage des lignes [f6]
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")
(global-set-key (kbd "<f6>") 'linum-mode)

;; Affiche les lignes et colonnes dans la barre du bas
(line-number-mode 1)
(column-number-mode 1)

;; Reduit la fontion sur elle meme
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key (kbd "<home>") 'hs-hide-block)
;; Et la developpe
(global-set-key (kbd "<f5>") 'hs-show-block)

;; Montre les parentheses
(show-paren-mode 1)

;; Descent/monte la fenetre de 2 lines quand le curseur est au bout
(setq scroll-step 3)

;; Suppression des espaces en fin de ligne dans les fichiers C et C++
(add-hook 'c-mode-hook '(lambda () (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook 'c++-mode-hook '(lambda () (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
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
