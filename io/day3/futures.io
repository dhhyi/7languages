"--------------------" println

// future := Object clone
// future do := method(wait(3); 5)

// futureResult := future @do

futureResult := URL with("http://www.google.com") @fetch

writeln("immediate")

writeln("fetched ", futureResult, " bytes")

writeln("after")
