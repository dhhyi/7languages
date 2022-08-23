class Person(name: String, age: Int) {
  println("Person constructor")

  def talk(message: String) = {
    if (age > 0) println(s"$name($age): $message")
    else println(s"$name: $message")
  }

  def this(name: String) = {
    this(name, 0)
    println("Person constructor without age")
  }
}

object Person {
  def createPerson(name: String) = new Person(name)
  def createPerson(name: String, age: Int) = new Person(name, age)
}

@main def main() = {
  val p1 = Person.createPerson("John")
  p1.talk("Hi")
  val p2 = Person.createPerson("Carl", 30)
  p2.talk("Hello")
  val p3 = Person.createPerson("Mary", 21)
  p3.talk("Hey")
}
