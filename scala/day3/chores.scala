def doChore(chore: String): Unit = 
  print(chore + ": ")
  chore match {
    case "clean dishes" => println("scrub, dry")
    case "cook dinner" => println("chop, sizzle")
    case _ => println("whine, complain")
  }

doChore("clean dishes")
doChore("cook dinner")
doChore("do the laundry")