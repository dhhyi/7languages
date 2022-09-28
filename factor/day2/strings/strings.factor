USING: kernel sequences ;
IN: day2.strings

: palindrome? ( s -- f ) dup reverse = ;
