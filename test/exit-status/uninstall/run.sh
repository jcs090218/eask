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
# Tests "uninstall" command

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# FIXME
# unclear what should happen here
# message seems to suggest that the package-file will be uninstalled
# but this does not work, e.g. eask install -> eask uninstall does not undo
# should_error eask uninstall

# TODO what if package file is specified

# Uninstall a package that isn't installed
should_run eask uninstall s

# Uninstall a built-in package
# FIXME huge stack trace
should_error eask uninstall ert

# seems like neither --strict or --allow-error has any effect
# there are eask warnings but strict does not effect them
should_run eask uninstall --strict s
