// https://doc.akka.io/docs/akka/current/typed/actors.html#first-example
// https://ammonite.io/#import$ivy

import $ivy.`com.typesafe.akka::akka-actor-typed:2.6.19`

import akka.actor.typed.scaladsl.Behaviors
// import akka.actor.typed.scaladsl.LoggerOps
import akka.actor.typed.{ActorRef, ActorSystem, Behavior}

object HelloWorld {
  final case class Greet(whom: String, replyTo: ActorRef[Greeted])
  final case class Greeted(whom: String, from: ActorRef[Greet])

  def apply(): Behavior[Greet] = Behaviors.receive { (context, message) =>
    println(s"Hello ${message.whom}!")
    message.replyTo ! Greeted(message.whom, context.self)
    Behaviors.same
  }
}

object HelloWorldBot {

  def apply(max: Int): Behavior[HelloWorld.Greeted] = {
    bot(0, max)
  }

  private def bot(
      greetingCounter: Int,
      max: Int
  ): Behavior[HelloWorld.Greeted] =
    Behaviors.receive { (context, message) =>
      val n = greetingCounter + 1
      println(s"Greeting $n for ${message.whom}")
      if (n == max) {
        Behaviors.stopped
      } else {
        message.from ! HelloWorld.Greet(message.whom, context.self)
        bot(n, max)
      }
    }
}

case class SayHello(name: String)

object HelloWorldMain {

  def apply(): Behavior[SayHello] =
    Behaviors.setup { context =>
      val greeter = context.spawn(HelloWorld(), "greeter")

      Behaviors.receiveMessage { message =>
        val replyTo = context.spawn(HelloWorldBot(max = 3), message.name)
        greeter ! HelloWorld.Greet(message.name, replyTo)
        Behaviors.same
      }
    }
}

@main def main() = {
  val system: ActorSystem[SayHello] =
    ActorSystem(HelloWorldMain(), "hello")

  system ! SayHello("World")
  system ! SayHello("Akka")
}
