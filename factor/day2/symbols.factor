USING: io kernel math namespaces prettyprint ;
IN: scratchpad

"------------------------" print

SYMBOL: percentage

percentage get .

0.1 percentage set

percentage get .

"------------------------" print

SYMBOL: flag

flag get .

flag on

flag get .

flag off

flag get .

flag toggle

flag get .

"------------------------" print

SYMBOL: counter

counter get .

counter inc

counter get .

counter dec

counter get .
