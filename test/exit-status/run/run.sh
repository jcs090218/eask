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
# Tests "run" command

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

should_error eask run
# FIXME
# should_error eask run command
# FIXME
# cd ./no-scripts/
# should_error eask run script
# cd ../

should_run eask run command my-command my-warn
# FIXME
# should_error eask run command --strict my-command my-warn

# FIXME stack trace
should_error eask run command my-error

OUTPUT="$(should_error eask run command --allow-error my-error my-command)"
# FIXME
# should_match "hello world" "$OUTPUT"

should_run eask run script hello
should_run eask run script hello foo
# FIXME
# should_error eask run script --strict hello foo

# FIXME this doesn't actually run the script
should_run eask run script warn
