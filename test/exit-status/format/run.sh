#!/usr/bin/env bash

# Copyright (C) 2022-2024 the Eask authors.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

## Commentary:
#
# Tests "format" command's option handling and error behaviour.

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# partial input
should_error eask format

# other commands default to apply to everything
should_run eask format elfmt mock.el
should_run eask format elisp-autofmt mock.el

# does anything create elfmt warnings?

should_error eask format elfmt fail.el
# FIXME
# should_error eask format elisp-autofmt fail.el

# FIXME throws
# OUTPUT=$(should_error eask format elfmt --allow-error fail.el mock.el)
# echo "$OUTPUT"
# should_match "Total of 1 .*" "$OUTPUT"

# FIXME
# OUTPUT=$(should_error eask format elisp-autofmt --allow-error fail.el mock.el)
# echo "$OUTPUT"
# should_match "Total of 1 .* formatted" "$OUTPUT"
