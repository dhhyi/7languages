USING: day2.strings tools.test ;
IN: day2.strings.tests

{ t } [ "racecar" palindrome? ] unit-test

{ f } [ "hello" palindrome? ] unit-test
