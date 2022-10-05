module TextFlow exposing (..)

import Browser
import Html exposing (Html, div, input, text)
import Html.Attributes exposing (placeholder, value)
import Html.Events exposing (onInput)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    String


init : Model
init =
    ""


type Msg
    = UpdateText String


update : Msg -> Model -> Model
update msg _ =
    case msg of
        UpdateText data ->
            data


view : Model -> Html Msg
view model =
    div []
        [ input [ placeholder "Text to reverse", value model, onInput UpdateText ] []
        , div [] [ text (String.reverse model) ]
        ]
