module MousePos exposing (..)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Html.Events.Extra.Mouse as Mouse


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    ( Float, Float )


init : Model
init =
    ( 0, 0 )


type Msg
    = MoveMsg ( Float, Float )


update : Msg -> Model -> Model
update msg _ =
    case msg of
        MoveMsg data ->
            data


view : Model -> Html Msg
view ( x, y ) =
    div
        [ Mouse.onMove (.clientPos >> MoveMsg), style "height" "100vh" ]
        [ text ("move mouse (" ++ String.fromFloat x ++ ", " ++ String.fromFloat y ++ ")") ]
