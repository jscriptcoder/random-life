module Components.ControlPanel exposing (..)

import Html exposing (Html, div, input)
import Html.Attributes
    exposing
        ( class
        , classList
        , type_
        , value
        )
import Html.Events exposing (onClick)


type alias Model =
    { playing : Bool
    , size : Int
    , ticks : Int
    }


type Msg
    = TogglePlay


init : Int -> Int -> Model
init size ticks =
    { playing = False
    , size = size
    , ticks = ticks
    }


view : Model -> Html Msg
view model =
    div
        [ class "control-panel" ]
        [ div
            [ classList
                [ ( "fa", True )
                , ( "fa-play", model.playing == False )
                , ( "fa-pause", model.playing == True )
                ]
            , onClick TogglePlay
            ]
            []
        , div
            [ class "size" ]
            [ input
                [ type_ "number"
                , Html.Attributes.min "30"
                , Html.Attributes.max "60"
                , value <| toString model.size
                ]
                []
            ]
        , div
            [ class "ticks" ]
            [ input
                [ type_ "number"
                , Html.Attributes.min "1"
                , Html.Attributes.max "1000"
                , value <| toString model.ticks
                ]
                []
            ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        TogglePlay ->
            { model | playing = not model.playing }
