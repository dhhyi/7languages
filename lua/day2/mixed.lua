print "-----------------"

mixed = {
    key = "value",
    "value1",
    2,
    foo = "bar"
}

function mixed:print()
    for k, v in pairs(self) do
        print(k, v)
    end
end

mixed:print()

print "---"

mixed.print(mixed)
