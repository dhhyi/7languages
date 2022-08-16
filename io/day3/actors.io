"-------------------------" println

slower := Object clone
slower start := method(wait(2); writeln("slower"))

faster := Object clone
faster start := method(wait(1); writeln("faster"))

slower @@start
faster @@start

writeln("done")
Coroutine currentCoroutine pause  
