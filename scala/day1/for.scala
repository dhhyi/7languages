@main def main(args: String*) = {
  println("----------------")

  for (i <- 0 until args.length) {
    println(s"argument $i: '${args(i)}' of type ${args(i).getClass}")
  }
}
