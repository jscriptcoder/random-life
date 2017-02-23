module Components.Grid exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Matrix exposing (Matrix)
import Components.Cell as Cell


type alias Model =
    Matrix Cell.Model


type Msg
    = CellMsg Cell.Msg


init : Int -> Model
init size =
    Matrix.square size (\loc -> Cell.model)


view : Model -> Html Msg
view model =
    Matrix.toList model
        |> List.map mapRow
        |> div [ class "grid" ]


mapRow : List Cell.Model -> Html Msg
mapRow row =
    List.map mapCell row
        |> div [ class "row" ]


mapCell : Cell.Model -> Html Msg
mapCell cell =
    Cell.view cell
        |> Html.map CellMsg
