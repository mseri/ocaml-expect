(******************************************************************************)
(* ocaml-expect: Expect-like framework                                        *)
(*                                                                            *)
(* Copytight (C) 2017, Marcello Seri                                          *)
(* Copyright (C) 2013, Sylvain Le Gall                                        *)
(* Copyright (C) 2010, OCamlCore SARL                                         *)
(*                                                                            *)
(* This library is free software; you can redistribute it and/or modify it    *)
(* under the terms of the GNU Lesser General Public License as published by   *)
(* the Free Software Foundation; either version 2.1 of the License, or (at    *)
(* your option) any later version, with the OCaml static compilation          *)
(* exception.                                                                 *)
(*                                                                            *)
(* This library is distributed in the hope that it will be useful, but        *)
(* WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY *)
(* or FITNESS FOR A PARTICULAR PURPOSE. See the file COPYING for more         *)
(* details.                                                                   *)
(*                                                                            *)
(* You should have received a copy of the GNU Lesser General Public License   *)
(* along with this library; if not, write to the Free Software Foundation,    *)
(* Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA              *)
(******************************************************************************)

open OUnit2
open Expect

let timeout = 0.1
let qa = "../qa.exe"

let printer_exit_code =
  function
    | Unix.WEXITED i | Unix.WSIGNALED i | Unix.WSTOPPED i ->
        string_of_int i

let with_qa test_ctxt ?use_stderr ?(exit_code=Unix.WEXITED 0) suite f =
  let _, real_exit_code =
    with_spawn
      ~verbose:true
      ~verbose_output:(logf test_ctxt `Info "%s")
      ?use_stderr
      ~timeout:(Some timeout) qa [|suite|]
      (fun t () -> f t) ()
  in
    assert_equal
      ~msg:"Exit code"
      ~printer:printer_exit_code
      exit_code
      real_exit_code
