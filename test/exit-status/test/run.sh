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
# Test command `test`
#

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# partial input
should_error eask test

# FIXME
# should_error eask test ert

echo "activate"
echo "----------"
cd ./activate/
should_run eask test activate
# FIXME stack trace when missing file

# can create an error by having (eval-after-load 'something (warn "")) in a file that provides 'something
should_run eask test activate test-activate.el
# FIXME
# should_error eask test activate --strict test-activate.el
cd ..

echo "buttercup"
echo "----------"
should_error eask test buttercup empty # no tests

# seems like buttercup either errors or runs, no warn?
should_error eask test buttercup ./buttercup/

echo "ecukes"
echo "----------"
# FIXME this throws file-missing, emits stack trace
should_error eask test ecukes

cd ./ecukes/
should_run eask test ecukes features/foo.feature
# FIXME expect failing tests to exit with non-zero
# should_error eask test ecukes
cd ..

echo "ert-runner"
echo "----------"
cd empty/
should_error eask test ert-runner
cd ..

# FIXME ert-runner ignores arguments
# should_run eask test ert-runner test/ert-test.el
# should_error eask test ert-runner test/ert-fail-test.el
should_error eask test ert-runner # all tests

echo "ert"
echo "----------"
# FIXME partial input should error
# should_error eask test ert

should_run eask test ert test/ert-test.el
should_error eask test ert test/ert-fail-test.el
should_error eask test ert test/*.el

# --allow-error has no effect

echo "melpazoid"
echo "----------"
# FIXME doesn't error, in fact it hardly seems to error
# should_error eask test --strict melpazoid melpazoid-warn/

# The only time it errors is with a malformed package-version header
should_error eask test melpazoid melpazoid-fail/

should_run eask test melpazoid empty/
