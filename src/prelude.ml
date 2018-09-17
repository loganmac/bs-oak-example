module Attr    = BsOakHtml.Property
module Browser = BsOakBrowser.Browser
module Cmd     = BsOakCore.Cmd
module Html    = BsOakHtml.Html
module Sub     = BsOakCore.Sub

module String = struct
  let from_int = string_of_int
end

(* Infix application operator. Mostly saves parentheses *)
let (<|) = (@@)

(* Infix (model, cmds) function *)
let (&!) model cmds = (model, Cmd.batch cmds)