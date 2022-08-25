val movies = <movies>
  <movie>The Incredibles</movie>
  <movie>Ants</movie>
  <short>Geri's Game</short>
</movies>

(movies \ "_").foreach { movie =>
  movie match {
    case <movie>{name}</movie> => println(name.text)
    case <short>{name}</short> => println(name.text + " (short)")
  }
}

