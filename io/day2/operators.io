"-------------------" println

OperatorTable addOperator("xor", 11)
// OperatorTable println

true xor := method(b, if(b, false, true))
false xor := method(b, if(b, true, false))

// (true xor(true)) println
// (false xor(false)) println

// (true xor(false)) println
// (false xor(true)) println

if(true xor(true), "Y" println, "N" println)
