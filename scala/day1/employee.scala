class Person(val name: String) {
  def talk(message: String) = println(name + " says: " + message)

  def id(): Any = name
}

class Employee(override val name: String, val number: Int)
    extends Person(name) {
  override def talk(message: String) = println(
    name + " with number " + number + " says: " + message
  )

  override def id() = number
}

@main def main() = {
  val p = new Person("Fred")
  p.talk("Hi")
  val e = new Employee("Barney", 42)
  e.talk("How are you?")

  println(p.id().getClass)
  println(e.id().getClass)
}
