;;; elisp-lint-ok.el --- Test the linting      -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2024  the Eask authors.

;;; Version: 0.0.1
;;; URL: https://foo.com
;;; Package-Requires: ((emacs "28.1"))

;;; Commentary:

;; Tests linting with elisp-lint
;; Also clean for packge lint

;;; Code:

(defun elisp-lint-ok-foo ()
  "Nothing here."
  (message "ok"))

(provide 'elisp-lint-ok)
;;; elisp-lint-ok.el ends here
