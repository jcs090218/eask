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
# Test command `lint`
#

set -e

source ./test/fixtures/home/scripts/testing.sh
cd $(dirname "$0")

# partial input
should_error eask lint

echo "checkdoc"
echo "----------"
should_run eask lint checkdoc declare-ok.el
# FIXME
# should_error eask lint checkdoc --strict checkdoc-fail.el
# should_error eask lint checkdoc --strict --allow-error checkdoc-fail.el declare-ok.el

echo "declare"
echo "----------"
should_run eask lint declare declare-ok.el

# warnings are default ignored
should_run eask lint declare declare-fail.el

# --strict
# FIXME should exit with error
# should_error eask lint declare --strict declare-fail.el

# FIXME should exit with error
# should_error eask lint declare --strict --allow-error ./*.el

echo "elint"
echo "----------"

should_run eask lint elint declare-ok.el
# FIXME
# should_error eask lint elint --strict checkdoc-fail.el

echo "elisp-lint"
echo "----------"

# no warnings
should_run eask lint elisp-lint --strict elisp-lint-ok.el
# warnings
should_run eask lint elisp-lint declare-ok.el

should_error eask lint elisp-lint --strict declare-ok.el
OUTPUT="$(should_error  eask lint elisp-lint --strict --allow-error checkdoc-fail.el  elisp-lint-ok.el  )"
echo "$OUTPUT"
should_match "2 files linted" "$OUTPUT"

echo "elsa"
echo "----------"

# no warnings
should_run eask lint elsa elisp-lint-ok.el
# warnings
should_run eask lint elsa elsa-warn.el
# elsa reports some issues as errors here
should_error eask lint elsa declare-ok.el

# FIXME
# should_error eask lint elsa --strict elsa-warn.el

echo "indent"
echo "----------"

should_run eask lint indent indent-warn.el
should_error eask lint indent --strict indent-warn.el
OUTPUT="$(should_error eask lint indent --strict --allow-error indent-warn.el declare-ok.el)"
echo "$OUTPUT"
should_match "2 files linted" "$OUTPUT"

echo "keywords"
echo "----------"

# TODO seems like keywords in actual file are ignored
# only those in Eask file are checked
# but those interfere with --strict handling in other commands
# should_run eask lint keywords
# should_error eask lint keywords --strict

echo "package"
echo "----------"

should_run eask lint package declare-ok.el
# FIXME
# should_error eask lint package --strict declare-ok.el

# note that all files are checked anyway so --allow-error has no effect

echo "regexps"
echo "----------"

should_error eask lint regexps regexp-warn.el
# FIXME regexp throws and is not caught so second file not linted
# OUTPUT="$(should_error eask lint regexps --allow-error regexp-warn.el declare-ok.el)"
# echo "$OUTPUT"
# should_match "2 files linted" "$OUTPUT"
