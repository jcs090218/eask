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
# Tests "install" command's option handling and error behaviour.

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# due to bad package dependency in Eask
should_error eask install

# requires melpa source
should_run eask install s

# not a package
should_error eask install 1234

# uninstall s before
eask uninstall s 1>/dev/null 2>&1
should_error eask install --allow-error 1234 s

# ensure s installed
echo "Check: eask list should show s"
OUTPUT="$(eask list 2>&1)"
should_match "s" "$OUTPUT"
