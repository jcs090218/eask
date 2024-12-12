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
# Tests "link" command's option handling and error behaviour.

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# partial input
should_error eask link
should_error eask link add
# FIXME should error
# should_error eask link delete

# FIXME stack trace when package name doesn't match link name
# prefer a better warning if this is important
# should_run eask link add foo ../fixtures/valid/

should_run eask link add valid-package ../fixtures/valid/

# FIXME stack trace when package doesn't have -pkg.el
# FIXME stack trace when link name does not match package name
# should_run eask link add valid-package ../install/

OUTPUT="$(should_run eask link list)"
echo "$OUTPUT"
should_match "valid-package" "$OUTPUT"

# when package/link doesn't exist
# FIXME: doesn't error
# should_error eask link delete foo

# no package after delete
# FIXME: can't delete using original link name, must use full name with version
# e.g. valid-package-0.0.1 works, but expect valid-package to work also
# OUTPUT=$(should_run eask link delete valid-package)
# echo "$OUTPUT"
# should_match "1 package unlinked" "$OUTPUT"
