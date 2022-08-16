"------------------" println

Builder := Object clone
Builder forward := method(
    write("<", call message name, ">")
    call message arguments foreach(arg,
        content := self doMessage(arg)
        if(content proto == Sequence, write(content))
    )
    write("</", call message name, ">")
)

Builder ul(
    li("one"),
    li("two"),
    li("three")
)
writeln
