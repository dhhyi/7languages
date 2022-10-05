module Car exposing (..)

import Browser
import Browser.Dom exposing (getViewport)
import Browser.Events exposing (onMouseMove, onResize)
import Canvas exposing (..)
import Canvas.Settings exposing (fill)
import Canvas.Settings.Advanced exposing (transform, translate)
import Color
import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Html.Lazy exposing (lazy)
import Json.Decode as Decode exposing (Decoder)
import Process
import Task


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , subscriptions = subscriptions
        , update = update
        }



-- MODEL


type alias Model =
    { screen : { width : Int, height : Int }
    , busy : Bool
    , x : Float
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { screen = { width = 800, height = 600 }
      , busy = False
      , x = 0
      }
    , Task.perform (\{ viewport } -> ScreenSize (round viewport.width) (round viewport.height)) getViewport
    )



-- UPDATE


type Msg
    = Other
    | ScreenSize Int Int
    | PostScreenSize
    | MouseX Float


delay : Msg -> Cmd Msg
delay msg =
    Process.sleep 50
        |> Task.andThen (always <| Task.succeed msg)
        |> Task.perform identity


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ScreenSize w h ->
            ( { model | screen = { width = w, height = h - 4 }, busy = True }
            , delay PostScreenSize
            )

        PostScreenSize ->
            ( { model | busy = False }
            , Cmd.none
            )

        MouseX x ->
            ( { model | x = x }, Cmd.none )

        Other ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


decodePosition : Decoder Float
decodePosition =
    Decode.field "pageX" Decode.float


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ onResize ScreenSize
        , onMouseMove (Decode.map MouseX decodePosition)
        ]



-- VIEW


clearScreen : Float -> Float -> Renderable
clearScreen width height =
    shapes [ fill Color.lightGray ] [ rect ( 0, 0 ) width height ]


draw : Float -> Float -> Color.Color -> Shape -> Renderable
draw x y color shape =
    shapes [ transform [ translate x y ], fill color ] [ shape ]


car : Float -> Float -> List Renderable
car x y =
    let
        carTop =
            rect ( 0, 0 ) 100 50

        carBottom =
            rect ( 0, 0 ) 160 50

        carTire =
            circle ( 0, 0 ) 24
    in
    [ draw (30 + x) (0 + y) Color.black carTop
    , draw (0 + x) (50 + y) Color.black carBottom
    , draw (40 + x) (102 + y) Color.red carTire
    , draw (120 + x) (102 + y) Color.red carTire
    ]


canvasView : Model -> Html msg
canvasView model =
    let
        width =
            model.screen.width

        height =
            model.screen.height

        carX =
            model.x

        carY =
            toFloat model.screen.height / 2
    in
    Canvas.toHtml
        ( width, height )
        []
        (clearScreen (toFloat width) (toFloat height) :: car carX carY)


view : Model -> Html Msg
view model =
    div
        [ style "display" "flex"
        , style "justify-content" "center"
        , style "align-items" "center"
        ]
        [ lazy canvasView model ]
