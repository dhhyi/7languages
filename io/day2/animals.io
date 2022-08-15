"-----------------" println

Object ancestors := method(
    prototype := self proto
    if (prototype != Object) then(
        writeln("Slots of ", prototype type)
        prototype slotNames foreach(slotName, writeln("- ", slotName))
        writeln(prototype ancestors)
    )
)

Animal := Object clone
Animal speak := method("ambiguous animal noise" println)

Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method("waddle" println)

disco := Duck clone

disco ancestors
