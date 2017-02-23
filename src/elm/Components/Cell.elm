module Components.Cell exposing (..)

import Html exposing (..)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick)


type alias Model =
    { alive : Bool }


type Msg
    = Toggle


model : Model
model =
    { alive = False }


view : Model -> Html Msg
view model =
    div
        [ classList
            [ ( "cell", True )
            , ( "is-alive", model.alive )
            ]
        , onClick Toggle
        ]
        []


update : Msg -> Model -> Model
update msg model =
    case msg of
        Toggle ->
            { model | alive = not model.alive }
