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
# Tests "analyze" command's option handling and error behaviour.
# See the tests in the test/checker directory too.

set -e

source ./test/fixtures/home/scripts/testing.sh

cd $(dirname "$0")

# Eask-normal - no errors or warnings
# Eask-warn   - only warnings
# Eask-error  - errors and  warnings

should_run eask analyze Eask-normal

should_run eask analyze Eask-warn

should_error eask analyze Eask-error

should_error eask analyze Eask-warn --strict

# sanity check: flag should not change behavior in this case
should_error eask analyze Eask-error --allow-error

# Should report that Eask-normal was tested
OUTPUT=$(should_error eask analyze --allow-error Eask-normal Eask-error)
echo "$OUTPUT"
should_match "(Checked 2 files)" "$OUTPUT"

# Can also use a more concise form, but it doesn't print the output
# should_match "(Checked 2 files)" "$(should_error eask analyze --allow-error Eask-normal Eask-error)"
