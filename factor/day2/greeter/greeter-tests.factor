USING: day2.greeter tools.test ;
IN: day2.greeter.tests

{ "Hello, Test!" } [ "Test" greeting ] unit-test

{ "Hello, World!" } [ "World" greeting ] unit-test
