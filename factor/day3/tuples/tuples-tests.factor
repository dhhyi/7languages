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

: sample-cart ( -- cart )
    "7lang" 19.99 1 <cart-item>
    "7lang2" 25.99 1 <cart-item>
    "pencil" <dollar-cart-item>
    3array ;

{ 1.26 } [ 1.2555555 round-price ] unit-test
{ 5.0 } [ 4.99999999999 round-price ] unit-test

{ T{ checkout
    { item-count 3 }
    { base-price 46.98 }
    { taxes 7.04 }
    { shipping 4.49 }
    { total-price 58.51 }
} }
[ sample-cart <checkout> sample-checkout ] unit-test
