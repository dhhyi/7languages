import scala.concurrent.Await
import scala.concurrent.duration.Duration
import scala.io.Source
import scala.concurrent.Future

implicit val ec: scala.concurrent.ExecutionContext =
  scala.concurrent.ExecutionContext.global

val waits = List(
  2000,
  1000,
  4000,
  3000
)

def waitFor(duration: Int) = {
  Thread.sleep(duration)
  "waited for " + duration
}

def getSequentially() = {
  waits.foreach(w => println(w + " " + waitFor(w)))
}

def getParallel() = {
  val futures = waits.map(w => Future { w + " " + waitFor(w) })
  futures.foreach(f => println(Await.result(f, Duration.Inf)))
}

@main def main() = {
  val t = time {
    // getSequentially()
    getParallel()
  }

  println(t._2.toMillis + " ms")
}
