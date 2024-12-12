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
# Tests "clean" command's option handling and error behaviour.

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

echo "Preparing test"
# clean elc should work
eask compile mock.el
if [ ! -f ./mock.elc ]; then
    echo "failed to create .elc files"
    exit 1
fi

echo "Test clean command"

# partial input
should_error eask clean

should_run eask clean elc

# dist is write protected
# FIXME either or both of these should error
# should_error eask clean dist
# should_error eask clean dist --strict

# recompile to use for --allow-error
eask compile mock.el

# FIXME
# expect that clean dist fails and clean elc succeeds
# should_error eask clean all --allow-error

# if [ -f ./mock.elc ]; then
#     echo "expected .elc files to be removed by eask clean all"
#     exit 1
# fi
