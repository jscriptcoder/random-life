module Components.RandomLife exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Components.ControlPanel as ControlPanel
import Components.Grid as Grid


type alias Model =
    { controlPanel : ControlPanel.Model
    , grid : Grid.Model
    }


type Msg
    = ControlPanelMsg ControlPanel.Msg
    | GridMsg Grid.Msg


init : Int -> Int -> ( Model, Cmd Msg )
init size ticks =
    ( { controlPanel = ControlPanel.init size ticks
      , grid = Grid.init size
      }
    , Cmd.none
    )


view : Model -> Html Msg
view model =
    div [ class "random-life" ]
        [ ControlPanel.view model.controlPanel |> Html.map ControlPanelMsg
        , Grid.view model.grid model.controlPanel.playing |> Html.map GridMsg
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ControlPanelMsg controlPanelMsg ->
            ( { model
                | controlPanel =
                    ControlPanel.update
                        controlPanelMsg
                        model.controlPanel
              }
            , Cmd.none
            )

        GridMsg gridMsg ->
            ( { model
                | grid =
                    Grid.update
                        gridMsg
                        model.grid
              }
            , Cmd.none
            )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
