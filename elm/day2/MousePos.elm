module MousePos exposing (..)

import Browser
import Html exposing (Html, br, div, text)
import Html.Attributes exposing (style)
import Html.Events.Extra.Mouse as Mouse


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { position : ( Float, Float )
    , clicks : Int
    }


init : Model
init =
    { position = ( 0, 0 )
    , clicks = 0
    }


type Msg
    = MoveMsg ( Float, Float )
    | ClickMsg


update : Msg -> Model -> Model
update msg model =
    case msg of
        MoveMsg data ->
            { model | position = data }

        ClickMsg ->
            { model | clicks = model.clicks + 1 }


formatPostion : ( Float, Float ) -> String
formatPostion ( x, y ) =
    "(" ++ String.fromFloat x ++ ", " ++ String.fromFloat y ++ ")"


view : Model -> Html Msg
view model =
    div
        [ Mouse.onMove (.clientPos >> MoveMsg)
        , Mouse.onClick (\_ -> ClickMsg)
        , style "height" "100vh"
        ]
        [ div [] [ text ("mouse position " ++ formatPostion model.position) ]
        , div [] [ text ("mouse clicks (" ++ String.fromInt model.clicks ++ ")") ]
        ]
