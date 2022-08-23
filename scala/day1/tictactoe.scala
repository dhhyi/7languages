class TicTacToe {
  var board = Array.ofDim[String](3, 3)
  for (i <- 0 until 3) {
    for (j <- 0 until 3) {
      board(i)(j) = "-"
    }
  }

  def canPlay(col: Int, row: Int): Boolean = {
    if (col < 0 || col > 2 || row < 0 || row > 2) {
      return false
    }
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

class Player(val player: String, val game: TicTacToe) {
  def play() = {}
}

class ComputerPlayer(override val player: String, override val game: TicTacToe)
    extends Player(player, game) {

  val r = scala.util.Random

  override def play() = {
    var col = 0
    var row = 0
    while {
      col = r.nextInt(3)
      row = r.nextInt(3)
      !game.canPlay(col, row)
    } do ()
    game.play(player, col, row)
  }
}

class HumanPlayer(override val player: String, override val game: TicTacToe)
    extends Player(player, game) {

  override def play() = {
    var col = 0
    var row = 0
    while {
      print(player + " enter column (1-3): ")
      col = scala.io.StdIn.readInt() - 1
      print(player + " enter row (1-3): ")
      row = scala.io.StdIn.readInt() - 1
      !game.canPlay(col, row)
    } do ()
    game.play(player, col, row)
  }
}

@main def main() = {
  val game = new TicTacToe

  val players = List(
    // new ComputerPlayer("X", game),
    new HumanPlayer("X", game),
    // new ComputerPlayer("O", game)
    new HumanPlayer("O", game)
  )

  var currentPlayer: Player = null
  var turn = 0

  while (!game.ended()) {
    currentPlayer = players(turn % 2)

    currentPlayer.play()

    game.dump()
    turn += 1
  }

  if (game.checkWinner() != "-") {
    println(s"${game.checkWinner()} wins")
  } else {
    println("Draw")
  }
}
