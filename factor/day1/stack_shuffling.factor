USING: io kernel tools.test ;

{ 1 2 3 4 4 } [ 1 2 3 4 dup ] unit-test

{ 1 2 3 4 3 } [ 1 2 3 4 over ] unit-test

{ 1 2 3 4 2 } [ 1 2 3 4 pick ] unit-test

{ 1 2 3 } [ 1 2 3 4 drop ] unit-test

{ 1 2 4 } [ 1 2 3 4 nip ] unit-test

{ 1 2 4 3 } [ 1 2 3 4 swap ] unit-test

{ 1 3 4 2 } [ 1 2 3 4 rot ] unit-test

{ 1 4 2 3 } [ 1 2 3 4 rot rot ] unit-test
