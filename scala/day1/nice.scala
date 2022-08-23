class Person(val name: String) {
  def greet() = println("Hello!")
}

trait Nice {
  def greet(): Unit = println("Howdily doodily.")
}

class Character(override val name: String) extends Person(name) with Nice {
  override def greet() = {
    super[Nice].greet()
  }
}

@main def main() = {
  val homer = new Person("Homer")
  homer.greet()

  val flanders = new Character("Ned")
  flanders.greet()
}
