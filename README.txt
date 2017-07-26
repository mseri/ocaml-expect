********************************************************************************
*  ocaml-expect: Expect-like framework for OCaml                               *
*                                                                              *
*  Copyright (C) 2010, OCamlCore SARL                                          *
*                                                                              *
*  This library is free software; you can redistribute it and/or modify it     *
*  under the terms of the GNU Lesser General Public License as published by    *
*  the Free Software Foundation; either version 2.1 of the License, or (at     *
*  your option) any later version, with the OCaml static compilation           *
*  exception.                                                                  *
*                                                                              *
*  This library is distributed in the hope that it will be useful, but         *
*  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY  *
*  or FITNESS FOR A PARTICULAR PURPOSE. See the file COPYING for more          *
*  details.                                                                    *
*                                                                              *
*  You should have received a copy of the GNU Lesser General Public License    *
*  along with this library; if not, write to the Free Software Foundation,     *
*  Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA               *
********************************************************************************

ocaml-expect - Expect-like framework
====================================

This is a simple implementation of `expect` to help building unitary testing
of interactive program.

It helps to receive question and send answers from an interactive process.
You can match the question using a regular expression (Str). You can also use
a timeout to ensure that the process answer in time.

See the [Expect manual](http://expect.nist.gov/) for more information and
example.

See the file [INSTALL.txt](INSTALL.txt) for building and installation
instructions.

[Home page](http://forge.ocamlcore.org/projects/ocaml-expect/)

Copyright and license
---------------------

(C) 2010 OCamlCore SARL

ocaml-expect is distributed under the terms of the GNU Lesser General Public
License version 2.1 with OCaml linking exception.

See [COPYING.txt](COPYING.txt) for more information.
