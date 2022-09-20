def factorial(n: Int): Int = {
  n match {
    case 0          => 1
    case x if x > 0 => n * factorial(n - 1)
  }
}

@main def main() = {
  println(factorial(0))
  println(factorial(1))
  println(factorial(2))
  println(factorial(3))
  println(factorial(4))
  println(factorial(5))
  println(factorial(-1))
}
