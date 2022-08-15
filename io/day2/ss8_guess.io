"-----------------" println

num := Random value(100) ceil
num println

checkInput := method(x, x < 0 or x > 100 or x isNan)

readNumber := method(
    x := -1
    while(checkInput(x),
        "Please guess (0-100): " print
        x = File standardInput readLine asNumber
        if(checkInput(x), "your input was not accepted: #{x}" interpolate println)
    )
    x
)

for(i, 1, 10,
  "Guess #{i}" interpolate println
  guess := readNumber()
  if(guess == num, writeln("You guessed correctly!"); return true)
  if(guess < num) then(write("higher! -- "))
  if(guess > num) then(write("lower! -- "))
)

writeln("You did not guess correctly :(")