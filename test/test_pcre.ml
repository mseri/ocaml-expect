(******************************************************************************)
(* ocaml-expect: Expect-like framework                                        *)
(*                                                                            *)
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

(** Run tests for Expect
    @author Sylvain Le Gall
  *)

open OUnit2
open Expect
open Test_common

let tests =
  "Expect" >:::
  [
    "std-pcre" >::
    (fun test_ctxt ->
       with_qa test_ctxt "std"
         (fun t ->
            assert_bool
              "Ask name"
              (ExpectPcre.expect t
                 [`Pat "What's your name\\? ", true]
                 false);

            send t "Sylvain\n";

            assert_bool
              "Answer hello"
              (ExpectPcre.expect t
                 [`Pat "Hello Sylvain", true]
                 false)));
  ]

let () = run_test_tt_main tests
