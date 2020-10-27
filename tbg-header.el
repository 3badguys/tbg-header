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
  (insert ";; Copyright © 2020-2027, by 3badguys\n\n"))

(defun insert-author ()
  "Insert author line."
  (insert ";; Author: 3badguys\n"))

(defun insert-version ()
  "Insert version line."
  (insert ";; Version: ▮\n"))

(defun insert-create-date ()
  "Insert create date line."
  (insert ";; Created: ▮\n"))

(defun insert-package-requires ()
  "Insert package requires line."
  (insert ";; Package-Requires: ▮\n"))

(defun insert-keyword ()
  "Insert keyword line."
  (insert ";; Keywords: ▮\n"))

(defun insert-license ()
  "Insert license line."
  (insert ";; License: GPL v3\n\n"))

(defun insert-not-gnu-emacs ()
  "Insert not gnu emacs line."
  (insert ";; This file is not part of GNU Emacs.\n\n"))

(defun insert-commentary ()
  "Insert commentary line."
  (insert ";;; Commentary:\n\n"))

(defun insert-code ()
  "Insert code line."
  (insert ";;; Code:\n\n"))

(defun insert-end ()
  "Insert end line."
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

;;;###autoload
(defun tbg-remove-header ()
  "Remove the file header."
  (interactive)
  (let (
        $titile-str $code-str $end-str
        $header-p1 $header-p2 $end-p1 $end-p2)
    (save-excursion
      (setq $titile-str (concat ";;; "
                                (if (buffer-file-name)
                                    (file-name-nondirectory (buffer-file-name))
                                  (buffer-name))
                                " --- "
                                ))
      (setq $code-str ";;; Code:\n\n")
      (setq $end-str (concat "\n;;; "
                             (if (buffer-file-name)
                                 (file-name-nondirectory (buffer-file-name))
                               (buffer-name))
                             " ends here\n"
                             ))
      ;;
      (beginning-of-buffer)
      (search-forward $titile-str nil t)
      (search-backward $titile-str nil t)
      (setq $header-p1 (point))
      (search-forward $code-str nil t)
      (setq $header-p2 (point))
      (delete-region $header-p1 $header-p2)
      ;;
      (end-of-buffer)
      (search-backward $end-str nil t)
      (setq $end-p1 (point))
      (search-forward $end-str nil t)
      (setq $end-p2 (point))
      (delete-region $end-p1 $end-p2)
      ;;
      )))

(provide 'tbg-header)

;;; tbg-header.el ends here
