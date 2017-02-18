module Components.Cell exposing (..)


type alias Model =
    { alive : Bool }


type Msg
    = NoOp


model : Model
model =
    { alive = False }
