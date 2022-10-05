#!/bin/sh

elmFile=$1

if [ -z "$elmFile" ]; then
    echo "Usage: run-with-canvas.sh <elm-file>"
    exit 1
fi

base=$(basename $elmFile .elm)
dir=$(dirname $elmFile)


cat <<EOF > $dir/$base.html
<!DOCTYPE html>
<html>
  <head>
    <style>
      body,
      div:first-child {
        margin: 0;
        height: 100vh;
      }
    </style>
  </head>
  <body>
    <main></main>
    <script src="https://unpkg.com/elm-canvas@2.2/elm-canvas.js"></script>
    <script src="./$base.js"></script>
    <script>
      var app = Elm.$base.init({ node: document.querySelector("main") });
      // you can use ports and stuff here
    </script>
  </body>
</html>
EOF

onchange $elmFile -ik -- elm make $elmFile --output=$dir/$base.js
