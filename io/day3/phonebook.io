"--------------------" println

OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg, r doMessage(arg))
    r
)

Map atPutNumber := method(key, value,
    self atPut(key asMutable removePrefix("\"") removeSuffix("\""), value)
)

s := File with("day3/phonebook.txt") openForReading contents

phoneNumbers := doString(s)
// phoneNumbers keys println
// phoneNumbers values println
phoneNumbers asJson println
