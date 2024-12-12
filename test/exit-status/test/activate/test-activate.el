;;; test-activate.el --- Test "activate"      -*- lexical-binding: t; -*-

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

;;; Version: 0.0.1

;;; Commentary:

;;; Code:

(declare-function ignore "subr.el" (&rest args))

(eval-after-load
    'test-activate
    (warn "called on activate"))

(provide 'test-activate)

;;; test-activate.el ends here
