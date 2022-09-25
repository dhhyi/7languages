print "---------------"

local function concatenate(a, b)
    local new = {}
    for i = 1, #a do
        new[i] = a[i]
    end
    for i = 1, #b do
        new[#a + i] = b[i]
    end
    return new
end

local function arrayToString(array)
    setmetatable(array, { __tostring = function(t)
        local str = ""
        for i = 1, #t do
            str = str .. t[i]
            if (i < #t) then str = str .. ", " end
        end
        return str
    end })
end

local arr1 = { 1, 2, 3 }
local arr2 = { 4, 5, 6 }

local concat = concatenate(arr1, arr2)

arrayToString(concat)
print(concat)

print "-- custom"

setmetatable(arr1, { __add = concatenate })

local concat2 = arr1 + arr2

arrayToString(concat2)
print(concat2)
