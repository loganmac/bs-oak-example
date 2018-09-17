open Prelude

type msg =
  | Increment
  | Decrement
  | Reset      
  | Set of int
  [@@bs.deriving {accessors}]
  (*
    This is a nice quality-of-life addon from Bucklescript,
    it will generate function names for each constructor name.
  *)

let init () = 4 &! []

let update msg model = match msg with
  | Increment -> model + 1 &! []
  | Decrement -> model - 1 &! []
  | Reset     -> 0 &! []
  | Set v     -> v &! []

let view model =
  Html.div
    []
    [ Html.span
        [ Attr.style [("text-weight", "bold")] ]
        [ Html.text (String.from_int model) ]
    ; Html.br [] []
    ; Html.button [ Attr.on_click Increment ] [ Html.text "Increment" ]
    ; Html.br [] []
    ; Html.button [ Attr.on_click Decrement ] [ Html.text "Decrement" ]
    ; Html.br [] []
    ; Html.button [ Attr.on_click <| Set 42 ] [ Html.text "Set to 42" ]
    ; Html.br [] []
    ; if model <> 0
      then Html.button [ Attr.on_click Reset ] [ Html.text "Reset" ]
      else Html.div  [] []
    ]

let main =
  Browser.element
    ~init:init
    ~update:update
    ~view:view
    ~subscriptions:(fun _ -> Sub.none)