"------------" println

Vehicle := Object clone
Vehicle description := "Test"
Vehicle description println 
Vehicle description = "Changed"
Vehicle description println

Vehicle slotNames println

Car := Vehicle clone
Car description println
Car slotNames println
Car type println

"\nferrari" println
ferrari := Car clone
ferrari slotNames println
ferrari type println
Vehicle description = "Changed again"
ferrari description println

Car drive := method("Vroom" println)
ferrari drive
ferrari proto println

Lobby println




