module Components.Cell exposing (..)

import Html exposing (..)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick, onMouseDown)
import Matrix exposing (Location)


type alias Model =
    { loc : Location
    , alive : Bool
    }


type Msg
    = Toggle Model


init : Location -> Bool -> Model
init loc alive =
    { loc = loc
    , alive = alive
    }


view : Model -> Html Msg
view model =
    div
        [ classList
            [ ( "cell", True )
            , ( "is-alive", model.alive )
            ]
        , onMouseDown (Toggle model)
        ]
        []


update : Msg -> Model
update msg =
    case msg of
        Toggle model ->
            { model | alive = not model.alive }
