def csvToMap(fileName: String): Map[String, String] = {
  scala.io.Source
    .fromFile(fileName)
    .getLines()
    .foldLeft(Map.empty[String, String])((acc, line) => {
      val parts = line.split(",")
      acc + (parts(0) -> parts(1))
    })
}

trait Censor {
  val replacements = csvToMap("day2/censor.csv")

  def censor(text: String): String = {
    replacements.foldLeft(text)((t, kv) => t.replace(kv._1, kv._2))
  }
}

class Person(val name: String, val word: String) extends Censor {
  def curse() = {
    println(censor(word))
  }
}

@main def main() = {
  val p1 = new Person("John", "shoot");
  p1.curse();

  val p2 = new Person("John", "darn");
  p2.curse();

  val p3 = new Person("John", "bollocks");
  p3.curse();
}
