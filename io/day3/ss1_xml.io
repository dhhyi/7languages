"------------------" println

level := -1

Builder := Object clone
Builder forward := method(
    level = level + 1
    hasNoChildren := call message arguments map(a, a name == a asString) reduce(a,v,a and v,true)

    for(i, 1, level, write("  "))
    write("<", call message name, ">")
    if(hasNoChildren, 0, writeln)
    call message arguments foreach(arg,
        content := self doMessage(arg)
        if(content proto == Sequence, write(content))
    )
    if(hasNoChildren, 0, for(i, 1, level, write("  ")))
    writeln("</", call message name, ">")
    level = level - 1
)

Builder ul(
    li("one"),
    li(b("two")),
    li("three")
)
writeln
