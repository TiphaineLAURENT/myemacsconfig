;;; Auto-source --- Auto Completion for GNU Emacs

;; Copyright (C) 2008, 2009, 2010  Tomohiro Matsuyama

;; Author: Tomohiro Matsuyama <m2ym.pub@gmail.com>
;; URL: http://cx4a.org/software/auto-complete
;; Keywords: completion, convenience
;; Version: 1.3.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; This mode provide an easy way to create source file for your class header
;; Juste create an header file, and then hit F7 to create the source file

(defun create-c-source ()
  (interactive)
  (find-file (concat (substring buffer-file-truename 0 -2) ".c"))
  )
(defun create-c++-source ()
  (interactive)
  (find-file (concat (substring buffer-file-truename 0 -4) ".cpp"))
  )

(add-hook 'c-mode-hook
	  '(lambda () (global-set-key (kbd "<f7>") 'create-c-source)))
(add-hook 'c++-mode-hook
	  '(lambda () (global-set-key (kbd "<f7>") 'create-c++-source)))

(provide 'auto-source)
