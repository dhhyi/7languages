USING: accessors kernel math math.functions sequences ;

IN: day3.tuples

TUPLE: cart-item name price quantity ;

: <dollar-cart-item> ( name -- cart-item )
    1 1 cart-item boa ;

: <one-cart-item> ( -- cart-item )
    T{ cart-item { quantity 1 } } ;

: <book-cart-item> ( price -- cart-item )
    "book" swap 1 cart-item boa ;

: <cart-item> ( name price quantity -- cart-item )
    cart-item boa ;

: rebate ( cart-item rebate -- cart-item )
    swap [ swap * ] change-price ;

TUPLE: checkout item-count base-price taxes shipping total-price ;

: round-price ( price -- price )
    100 * round 100 / ;

: sum ( seq -- sum )
    0 [ + ] reduce ;

: cart-item-count ( cart -- count )
    [ quantity>> ] map sum ;

: cart-item-price ( cart-item -- price )
    [ price>> ] [ quantity>> ] bi * ;

: cart-base-price ( cart -- price )
    [ cart-item-price ] map sum ;

: <base-checkout> ( item-count base-price -- checkout )
    f f f checkout boa ;

: <checkout> ( cart -- checkout )
    [ cart-item-count ] [ cart-base-price ] bi <base-checkout> ;

CONSTANT: gst-rate 0.05
CONSTANT: pst-rate 0.09975

: gst-pst ( price -- taxes )
    [ gst-rate * ] [ pst-rate * ] bi + ;

: taxes ( checkout taxes-calc -- checkout )
    [ dup base-price>> ] dip
    call round-price >>taxes ; inline

CONSTANT: base-shipping 1.49
CONSTANT: per-item-shipping 1.0

: per-item ( checkout -- shipping )
    per-item-shipping * base-shipping + ;

: shipping ( checkout shipping-calc -- checkout )
    [ dup item-count>> ] dip
    call >>shipping ; inline

: total ( checkout -- total )
    dup
    [ base-price>> ] [ taxes>> ] [ shipping>> ] tri + + >>total-price ;
