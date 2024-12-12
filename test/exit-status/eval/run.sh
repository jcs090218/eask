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
# Tests "eval" command's option handling and error behaviour.

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# partial input
should_error eask eval

should_run eask eval '(message "hello")'

should_run eask eval '(warn "hello")'

# FIXME
# should_error eask eval '(warn "hello")' --strict

should_error eask eval '(error "hello")'
should_error eask eval "(signal 'error \"hello\")"
# --allow-error doesn't really change anything here
should_error eask eval '(error "hello")' --allow-error
