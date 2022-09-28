USING: tools.test io io.streams.null kernel namespaces sequences prettyprint ;

USE: day2.greeter
USE: day2.strings

IN: test-suite

: test-all ( -- )
  [ "day2" test ] with-null-writer
  test-failures get empty?
    [ "All tests passed." print ] [ :test-failures ] if
  ;

MAIN: test-all
