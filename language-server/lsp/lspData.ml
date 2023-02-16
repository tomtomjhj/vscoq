(**************************************************************************)
(*                                                                        *)
(*                                 VSCoq                                  *)
(*                                                                        *)
(*                   Copyright INRIA and contributors                     *)
(*       (see version control and README file for authors & dates)        *)
(*                                                                        *)
(**************************************************************************)
(*                                                                        *)
(*   This file is distributed under the terms of the MIT License.         *)
(*   See LICENSE file.                                                    *)
(*                                                                        *)
(**************************************************************************)
open Sexplib.Std

module Position = struct
  
  type t = { line : int; character : int; } [@@deriving sexp, yojson]

  let compare pos1 pos2 =
    match Int.compare pos1.line pos2.line with
    | 0 -> Int.compare pos1.character pos2.character
    | x -> x

  let to_string pos = Format.sprintf "(%i,%i)" pos.line pos.character

end

module Range = struct

  type t = {
    start : Position.t;
    end_ : Position.t; [@key "end"]
  } [@@deriving sexp, yojson]

end 

module Severity = struct

  type t = Feedback.level =
  | Debug [@value 1]
  | Info [@value 2]
  | Notice [@value 3]
  | Warning [@value 3]
  | Error [@value 4]
  [@@deriving sexp, yojson]

end

module Diagnostic = struct

  type t = {
    range : Range.t;
    message : string;
    severity : Severity.t;
  } [@@deriving sexp, yojson]

end

type query_result =
  { id : string;
    name : string;
    statement : string;
  } [@@deriving yojson]

type notification =
  | QueryResultNotification of query_result

module Error = struct

  let parseError = -32700
  let invalidRequest = -32600
  let methodNotFound = -32601
  let invalidParams = -32602
  let internalError = -32603
  let jsonrpcReservedErrorRangeStart = -32099
  let serverNotInitialized = -32002
  let unknownErrorCode = -32001
  let lspReservedErrorRangeStart = -32899
  let requestFailed = -32803
  let serverCancelled = -32802
  let contentModified = -32801
  let requestCancelled = -32800
  let lspReservedErrorRangeEnd = -32800

end
