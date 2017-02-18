module Main exposing (..)

import Html exposing (program)
import Components.RandomLife as RandomLife exposing (Model, Msg)


main : Program Never Model Msg
main =
    program
        { view = RandomLife.view
        , update = RandomLife.update
        , subscriptions = RandomLife.subscriptions
        , init = RandomLife.init 30
        }
