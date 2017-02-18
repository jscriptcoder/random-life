module Components.RandomLife exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Components.Grid as Grid


type alias Model =
    { grid : Grid.Model }


type Msg
    = NoOp
    | GridMsg Grid.Msg


init : Int -> ( Model, Cmd Msg )
init size =
    ( { grid = Grid.init size }, Cmd.none )


view : Model -> Html Msg
view model =
    div [ class "random-life" ]
        [ Grid.view model.grid
            |> Html.map GridMsg
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
