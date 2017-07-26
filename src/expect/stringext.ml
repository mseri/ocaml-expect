(******************************************************************************)
(* ocaml-expect: Expect-like framework                                        *)
(*                                                                            *)
(* Copytight (C) 2017, Marcello Seri                                          *)
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

(** True if string 'x' ends with suffix 'suffix' *)
let ends_with ~suffix x =
  let x_l = String.length x and suffix_l = String.length suffix in
  suffix_l <= x_l && String.sub x (x_l - suffix_l) suffix_l = suffix

(** True if string 'x' starts with prefix 'prefix' *)
let starts_with ~prefix x =
  let x_l = String.length x and prefix_l = String.length prefix in
  prefix_l <= x_l && String.sub x 0 prefix_l  = prefix

(** True if 'substring' is a substring of 'x'. Simple, naive, slow *)
let contains ~substring x =
  try
    let len = String.length substring in
    for i = 0 to String.length x - len do
      if String.sub x i len = substring then raise Exit
    done;
    false
  with Exit -> true

(** [String.split sep s] returns the list of all (possibly empty)
    substrings of [s] that are delimited by the [sep] character.

    The function's output is specified by the following invariants:

    - The list is not empty.
    - Concatenating its elements using [sep] as a separator returns a
      string equal to the input ([String.concat (String.make 1 sep)
      (String.split sep s) = s]).
    - No string in the result contains the [sep] character.

    Implementation from ocaml 4.04.0 String module.
 +*)
let split ~sep s =
  let open String in
  let r = ref [] in
  let j = ref (length s) in
  for i = length s - 1 downto 0 do
    if unsafe_get s i = sep then begin
      r := sub s (i + 1) (!j - i - 1) :: !r;
      j := i
    end
  done;
  sub s 0 !j :: !r
