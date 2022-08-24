@main def main() = {
  val list = List("one", "two", "three")
  println(list.foldLeft(0)((acc, x) => acc + x.length))
}
