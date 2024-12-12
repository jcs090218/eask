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
# Tests "compile" command's option handling and error behaviour.

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# FIXME this should match other commands which exit with status 1
# partial input errors when there are no files
# cd empty
# should_error eask compile
# cd ../

# compiles with a warning
should_run eask compile mock.el

should_error eask compile --strict mock.el

# --allow-error
# rest state
eask clean elc -v 0
should_error eask compile fail.el
should_error eask compile --allow-error fail.el mock.el

# ensure mock.el is still compiled
if [ ! -f mock.elc ]; then
    echo "fail: expected to see mock.elc"
    exit 1
fi
