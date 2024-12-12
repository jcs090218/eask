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
# Tests "reinstall" command

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# FIXME
# unclear what should happen here
# message seems to suggest that the package-file will be uninstalled
# but this does not work, e.g. eask install -> eask uninstall does not undo
# should_error eask reinstall

# TODO this is some weird bug with install
eask install || true # this fails, seems to want to print a message but throws
eask install lint # already installed, but without the previous step it would fail

# now it thinks this is unavailable
should_run eask reinstall lint
# FIXME no effect
# should_error eask reinstall --strict lint

# reinstall a package that isn't installed
should_run eask reinstall s

# reinstall a built-in package
# FIXME huge stack trace
should_error eask reinstall ert

# seems like neither --strict or --allow-error has any effect
