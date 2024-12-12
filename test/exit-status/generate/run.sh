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
# Tests "generate" command's option handling and error behaviour.

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# partial input
should_error eask generate
should_error eask generate ignore
should_error eask generate license
should_error eask generate test
should_error eask generate workflow

# FIXME partial input
# should_error eask generate recipe

# FIXME
# should_error eask generate ignore foobar123
# should_error eask generate license foobar123

should_run eask generate license mit
# FIXME when LICENSE already exists
# should_error eask generate licence mpl-2.0

# FIXME prints a stack trace
# folder exists
should_error eask generate test ert

# TODO can't test until autoload error is handled
# --strict
# --allow-error
