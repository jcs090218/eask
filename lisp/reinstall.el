;;; reinstall.el --- Reinstall packages  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Command use to reinstall Emacs packages,
;;
;;   $ eask reinstall [names..]
;;
;;
;;  Initialization options:
;;
;;    [names..]     name of the package to reinstall
;;

;;; Code:

(load (expand-file-name
       "_prepare.el"
       (file-name-directory (nth 1 (member "-scriptload" command-line-args))))
      nil t)

(eask-load "package")  ; load dist path

(defun eask--help-reinstall ()
  "Print help if command failed."
  )

(defun eask--reinstall-packages (names)
  "Install packages."
  (let* ((names (mapcar #'intern names))
         (len (length names)) (s (eask--sinr len "" "s"))
         (pkg-not-installed (cl-remove-if #'package-installed-p names))
         (installed (length pkg-not-installed)) (skipped (- len installed)))
    (eask-log "Reinstalling %s specified package%s..." len s)
    (mapc #'eask-package-install names)
    (eask-info "(Total of %s package%s reinstalled, %s skipped)"
               installed s skipped)))

(eask-start
  (eask-pkg-init)
  (if-let ((names (eask-args)))
      ;; If package [name..] are specified, we try to install it
      (eask--reinstall-packages names)
    ))

;;; reinstall.el ends here
