/**
 * Copyright (C) 2023 Jen-Chieh Shen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

"use strict";

exports.command = ['generate <type>'];
exports.desc = 'Generate files that are used for the development';
exports.builder = function (yargs) {
  yargs.usage(`${exports.desc}

Usage: eask generate <type> [options..]`)
    .commandDir('../generate/')
    .demandCommand();

  /* XXX: Configure only in the menu. */
  if (UTIL.cmd_count() == 1) {
    yargs.positional(
      '<type>', {
        description: 'type of the file',
      });
  }
}

exports.handler = async (argv) => { };
