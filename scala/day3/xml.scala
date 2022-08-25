val movies = <movies>
  <movie genre="action" year="2009">The Dark Knight</movie>
  <movie genre="comedy" year="2011">WALL-E</movie>
</movies>

val nodes = (movies \\ "movie")
println(nodes(1) \ "@genre")
