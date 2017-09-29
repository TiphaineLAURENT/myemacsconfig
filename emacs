;;
;; .emacs for Emacs in /home/tiphaine
;; 
;; Made by Tiphaine
;; Login   <tiphaine.laurent@epitech.net>
;; 
;; Started on  Thu Sep 28 16:43:44 2017 Tiphaine
;; Last update Fri Sep 29 13:33:15 2017 Tiphaine
;;

; EMACS SETUP

;; Make auto-save if emacs if killed
;;; BE CAREFUL IF YOU DISABLE IT
(add-hook 'kill-emacs-hook 'do-auto-save)

;; Add elisp folder to load path
(add-to-list 'load-path "~/.emacs.d/elisp")

;; Change backup files' folder to  ~/.emacs.d/backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 5
      kept-old-versions 5
      )


; USER CONFIGURATION

;; Auto-indent on save
;;; Disabled by default to prevent wrong emacs indentation
;(add-hook 'before-save-hook 'c-indent-defun)

;; Indentation step
(setq c-basic-offset 2			; Indent level after keyword (default: 2)
      c-indent-tabs-mode t		; Indent using tab (default: true)
      c-indent-level 8			; Tab length (default: 8)
      c-tab-always-indent t		; Tab always mean indent; use M-i to write tab (default: true)
      )

;; Lign number display [f6]
;;; Default value is true
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(global-set-key (kbd "<f6>") 'linum-mode)

;; Lign and column number bottom display
;;; Default value is true | true
(line-number-mode t)
(column-number-mode t)

;; Wrap and unwrap function's core [home]
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key (kbd "<home>") 'hs-toggle-hiding)

;; Montre les parentheses
;;; Default value is true
(show-paren-mode t)

;; Scroll the window when cursor near extremity
;;; Default value is 3
(setq scroll-step 3)

;; Trailing whitespace deleted in C and C++ mode
;;; Default value is true | true
(add-hook 'c-mode-hook
	  '(lambda() (add-hook 'write-contents-hooks
			       'delete-trailing-whitespace nil t)))
(add-hook 'c++-mode-hook
	  '(lambda() (add-hook 'write-contents-hooks
			       'delete-trailing-whitespace nil t)))

;; Traling backspace deletion at save time in all mode
;;; Disabled by default
;;; You can enable it to delete trailing whitespace in all mode
;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; C++ mode for .h file
;;; Disabled by default because of the use of .hpp
;(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


; USER CUSTOM MAJOR MODE

;; Auto-completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
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

;; Auto-source for class headers [f7]
(require 'auto-source)

;; Epitech header [C-c h]
;;; Set user-custom-name if you want to specify a name for your header
(require 'std)
(require 'std_comment)
;(setq user-custom-name "")

;; Column indicator [f9]
;;; Default value is 70
;;; Increase readability and debug speed of your code
(require 'fill-column-indicator)
(add-hook 'c-mode-common-hook 'fci-mode)
(global-set-key (kbd "<f9>") 'fci-mode)
(setq fci-rule-column 70)
