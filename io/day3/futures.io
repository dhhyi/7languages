"--------------------" println

future := Object clone
future do := method(wait(3); 5)

futureResult := future @do

writeln("immediate")

writeln("fetched ", futureResult, " bytes")

writeln("after")
