USING: accessors arrays kernel math tools.test prettyprint ;
USE: day3.tuples
IN: day3.tuples.tests

{ T{ cart-item f f 4.5 f } }
[ cart-item new 4.5 >>price ] unit-test

{ T{ cart-item f f 10.0 f } }
[
    cart-item new 20 >>price
    [ 0.5 * ] change-price
] unit-test

{ T{ cart-item f "7languages" 25 1 } }
[ "7languages" 25 1 cart-item boa ] unit-test

{ T{ cart-item f "pencil" 1 1 } }
[ "pencil" <dollar-cart-item> ] unit-test

{ T{ cart-item f "bag" f 1 } }
[ <one-cart-item> "bag" >>name ] unit-test

{ T{ cart-item f "apple" 0.6 f } }
[ T{ cart-item f "apple" 0.6 } ] unit-test

{ T{ cart-item f "book" 49.99 1 } }
[ 49.99 <book-cart-item> ] unit-test

{ T{ cart-item f "book" 15.0 1 } }
[ 50 <book-cart-item> 0.3 rebate ] unit-test

: sample-checkout ( checkout -- checkout )
    [ gst-pst ] taxes [ per-item ] shipping total ;

: sample-cart ( -- cart )
    "7lang" 19.99 1 <cart-item>
    "7lang2" 25.99 1 <cart-item>
    "pencil" <dollar-cart-item>
    1.0 <book-cart-item>
    4array ;

{ 1.26 } [ 1.2555555 round-price ] unit-test
{ 5.0 } [ 4.99999999999 round-price ] unit-test

{ T{ checkout
    { item-count 4 }
    { base-price 47.98 }
    { taxes 7.19 }
    { shipping 5.49 }
    { total-price 60.66 }
} }
[ sample-cart <checkout> sample-checkout ] unit-test

: mwst ( price -- taxes )
    0.17 * ;

: simple-order-shipping ( number-of-items -- shipping )
    2 > [ 0.0 ] [ 5.0 ] if ;

: sample-checkout2 ( checkout -- checkout )
    [ mwst ] taxes [ simple-order-shipping ] shipping total ;

{ T{ checkout
    { item-count 4 }
    { base-price 47.98 }
    { taxes 8.16 }
    { shipping 0.0 }
    { total-price 56.14 }
} }
[ sample-cart <checkout> sample-checkout2 ] unit-test
