module Components.RandomLife exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Components.Grid as Grid


type alias Model =
    { playing : Bool
    , grid : Grid.Model
    }


type Msg
    = GridMsg Grid.Msg


init : Int -> ( Model, Cmd Msg )
init size =
    ( { playing = False
      , grid = Grid.init size
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div [ class "random-life" ]
        [ Grid.view model.grid |> Html.map GridMsg ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GridMsg gridMsg ->
            ( { model
                | grid = Grid.update gridMsg model.grid
              }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
