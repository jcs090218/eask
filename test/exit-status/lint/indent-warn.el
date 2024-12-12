;;; indent-warn.el --- Test indent linting      -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2024  the Eask authors.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Test indent.
;; Should only cause warnings

;;; Code:

(defun indent-warn-foo ()
  (if 't
          (message "Ok")
 (message
     "no")))

;;; indent-warn.el ends here
