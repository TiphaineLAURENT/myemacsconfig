;; -----------------------------------
;;    AUTOSAVE AT EMACS SHUTDOWN
;;-----------------------------------
(add-hook 'kill-emacs-hook 'do-auto-save)

;;-----------------------------------
;;           EPITECH CONFIG
;;-----------------------------------
(load "~/.emacs.d/epitech/std.el")
(load "~/.emacs.d/epitech/std_comment.el")

;;-----------------------------------
;;              MELPA
;;-----------------------------------
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "e1943fd6568d49ec819ee3711c266a8a120e452ba08569045dd8f50cc5ec5dd3" default)))
 '(package-selected-packages
   (quote
    (sublime-themes cmake-mode cpputils-cmake dockerfile-mode docker-compose-mode fill-column-indicator auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

;;----------------------------------
;;             THEMES
;;----------------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'hickey t)

;;----------------------------------
;;         AUTO-COMPLETE
;;----------------------------------
(require 'auto-complete-config)
(ac-config-default)

;;----------------------------------
;;   CHANGE BACKUP CONFIGURATIONS
;;----------------------------------
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")) ; Change directory
      backup-by-copying t				    ; Make copy rather than rename
      version-control t					    ; Allow emacs to create numbered backup
      delete-old-versions t				    ; Remove excess backup silently
      kept-new-versions 2				    ; Number of newest backups to keep
      kept-old-versions 2				    ; Number of oldest backups to keep
      )

;;-----------------------------------
;;           INDENTATION
;;-----------------------------------
(setq c-default-style "linux"		; Default style (default: gnu)
      c-basic-offset 8			; Indent level at start of line (default: 2)
      tab-width 8			; Tab length in all mode (default: 4)
      c-indent-tabs-mode t		; Indent using tab (default: true)
      c-tab-always-indent t		; Tab always mean indent; use M-i to write tab (default: true)
      )
(setq-default tab-width 8)

;;-----------------------------------
;;     LIGN NUMBER DISPLAY [f6]
;;-----------------------------------
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(global-set-key (kbd "<f6>") 'linum-mode)

;;-----------------------------------
;;     CURSOR POSITION DISPLAY
;;-----------------------------------
(line-number-mode t)
(column-number-mode t)

;;-----------------------------------
;;       PARENTHESES DISPLAY
;;-----------------------------------
(show-paren-mode t)

;;-----------------------------------
;;        WINDOW SCROLLING
;;-----------------------------------
(setq scroll-step 3)

;;-----------------------------------
;;   TRAILING WHITESPACES DELETION
;;-----------------------------------
(add-hook 'c-mode-common-hook
	  '(lambda() (add-hook 'write-contents-hooks
			       'delete-trailing-whitespace nil t)
	     )
	  )

;;-----------------------------------
;;       FILL COLUMN INDICATOR [f9]
;;-----------------------------------
(require 'fill-column-indicator)
(add-hook 'c-mode-common-hook 'fci-mode)
(global-set-key (kbd "<f9>") 'fci-mode)
(setq fci-rule-column 70)

;;-----------------------------------
;;     COMMENT / UNCOMMENT LINE
;;-----------------------------------
(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    )
  )
(global-set-key (kbd "C-x :") 'comment-or-uncomment-line-or-region)

;;-----------------------------------
;;  REMOVE INDENTATION IN NAMESPACE
;;-----------------------------------
(c-set-offset 'innamespace 0)

;;-----------------------------------
;;         CMAKE MAJOR MODE
;;-----------------------------------
(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)
