class TicTacToe {
  var board = Array.ofDim[String](3, 3)
  for (i <- 0 until 3) {
    for (j <- 0 until 3) {
      board(i)(j) = "-"
    }
  }

  def canPlay(col: Int, row: Int): Boolean = {
    if (board(row)(col) == "-") {
      return true
    }
    return false
  }

  def play(player: String, col: Int, row: Int) = {
    println(s"$player plays at (${col + 1}, ${row + 1})")
    board(row)(col) = player
  }

  def checkWinner(): String = {
    for (i <- 0 until 3) {
      if (board(i)(0) == board(i)(1) && board(i)(1) == board(i)(2)) {
        return board(i)(0)
      }
    }
    for (i <- 0 until 3) {
      if (board(0)(i) == board(1)(i) && board(1)(i) == board(2)(i)) {
        return board(0)(i)
      }
    }
    if (board(0)(0) == board(1)(1) && board(1)(1) == board(2)(2)) {
      return board(0)(0)
    }
    if (board(0)(2) == board(1)(1) && board(1)(1) == board(2)(0)) {
      return board(0)(2)
    }
    return "-"
  }

  def ended(): Boolean = {
    if (checkWinner() != "-") {
      return true
    }

    for (i <- 0 until 3) {
      for (j <- 0 until 3) {
        if (board(i)(j) == "-") {
          return false
        }
      }
    }
    return true
  }

  def dump() = {
    for (i <- 0 until 3) {
      for (j <- 0 until 3) {
        print(board(i)(j) + " ")
      }
      println()
    }
    println()
  }
}

@main def main() = {
  val game = new TicTacToe

  val r = scala.util.Random

  var player = ""

  while (!game.ended()) {
    if (player == "X") {
      player = "O"
    } else {
      player = "X"
    }

    var row = -1
    var col = -1
    while
      row = r.nextInt(3)
      col = r.nextInt(3)
      !game.canPlay(row, col)
    do ()

    game.play(player, row, col)
    game.dump()
  }

  if (game.checkWinner() != "-") {
    println(s"${game.checkWinner()} wins")
  } else {
    println("Draw")
  }
}
