"------------------" println

level := -1

Builder := Object clone

curlyBrackets := method(
    m := Map clone
    call message arguments map(a, a asString split(" : ")) foreach(v, 
        m atPut(
            v at(0) removePrefix("\"") removeSuffix("\""), 
            v at(1) removePrefix("\"") removeSuffix("\"")
        )
    )
    m
)

Builder forward := method(
    level = level + 1

    hasNoChildren := call message arguments map(a, a name == a asString) reduce(a, v ,a and v, true)

    for(i, 1, level, write("  "))
    write("<", call message name)

    hasAttributes := false
    if(call message arguments at(0) and call message arguments at(0) name == "curlyBrackets") then(
        hasAttributes = true
        content := doMessage(call message arguments at(0))
        content keys foreach(key, write(" ", key, "=\"", content at(key), "\""))
    )
    write(">")

    // if(hasNoChildren, write("nC"))
    // if(hasAttributes, write("A"))
    if(hasNoChildren or hasAttributes, write, writeln)

    call message arguments foreach(arg,
        content := self doMessage(arg)
        if(content proto == Sequence, write(content))
    )

    if(hasNoChildren or hasAttributes, 0, for(i, 1, level, write("  ")))
    writeln("</", call message name, ">")

    level = level - 1
)

Builder ul({ "class": "list-unstyled", "dummy": "test" },
    li({ "class": "bold" }, "one"),
    li(b({ "class": "bold" }, "two")),
    li("three")
)
