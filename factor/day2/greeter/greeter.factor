USING: kernel sequences ;
IN: day2.greeter

: greeting ( name -- greeting ) "Hello, " swap append "!" append ;
