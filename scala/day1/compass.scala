class Compass {
  val directions = List("N", "E", "S", "W")
  var bearing = 0
  println("Initial bearing: " + directions(bearing))

  def direction() = directions(bearing)

  def inform(turnDirection: String) = {
    println(s"Turning $turnDirection. Now bearing ${direction()}")
  }

  def turnRight() = {
    bearing = (bearing + 1) % directions.size
    inform("right")
  }
  def turnLeft() = {
    bearing = (bearing + (directions.size - 1)) % directions.size
    inform("left")
  }
}

@main def main() = {
  val compass = new Compass
  compass.turnRight()
  compass.turnRight()
  compass.turnRight()
  compass.turnRight()
  compass.turnRight()
  compass.turnLeft()
}
