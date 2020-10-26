;;; tbg-header.el --- ▮ -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2020-2027, by 3badguys

;; Author: 3badguys
;; Version: ▮
;; Created: ▮
;; Package-Requires: ▮
;; Keywords: ▮
;; License: GPL v3

;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:


(defun insert-title ()
  "Insert titile line."
  (insert (concat ";;; "
                  (if (buffer-file-name)
                      (file-name-nondirectory (buffer-file-name))
                    (buffer-name))
                  " --- ▮ -*- coding: utf-8; lexical-binding: t; -*-\n\n"
                  )))

(defun insert-copyright ()
  "Insert copyright line."
  (interactive)
  (insert ";; Copyright © 2020-2027, by 3badguys\n\n"))

(defun insert-author ()
  "Insert author line."
  (interactive)
  (insert ";; Author: 3badguys\n"))

(defun insert-version ()
  "Insert version line."
  (interactive)
  (insert ";; Version: ▮\n"))

(defun insert-create-date ()
  "Insert create date line."
  (interactive)
  (insert ";; Created: ▮\n"))

(defun insert-package-requires ()
  "Insert package requires line."
  (interactive)
  (insert ";; Package-Requires: ▮\n"))

(defun insert-keyword ()
  "Insert keyword line."
  (interactive)
  (insert ";; Keywords: ▮\n"))

(defun insert-license ()
  "Insert license line."
  (interactive)
  (insert ";; License: GPL v3\n\n"))

(defun insert-not-gnu-emacs ()
  "Insert not gnu emacs line."
  (interactive)
  (insert ";; This file is not part of GNU Emacs.\n\n"))

(defun insert-commentary ()
  "Insert commentary line."
  (interactive)
  (insert ";;; Commentary:\n\n"))

(defun insert-code ()
  "Insert code line."
  (interactive)
  (insert ";;; Code:\n\n"))

(defun insert-end ()
  "Insert end line."
  (interactive)
  (insert (concat "\n;;; "
                  (if (buffer-file-name)
                      (file-name-nondirectory (buffer-file-name))
                    (buffer-name))
                  " ends here\n"
                  )))

;;;###autoload
(defun tbg-insert-header ()
  "Insert the file header."
  (interactive)
  (save-excursion
    ;;
    (beginning-of-buffer)
    (insert-title)
    (insert-copyright)
    (insert-author)
    (insert-version)
    (insert-create-date)
    (insert-package-requires)
    (insert-keyword)
    (insert-license)
    (insert-not-gnu-emacs)
    (insert-commentary)
    (insert-code)
    ;;
    (end-of-buffer)
    (insert-end)
    ;;
    ))

(provide 'tbg-header)

;;; tbg-header.el ends here
