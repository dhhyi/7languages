print "-------------------"

function orderedPairs(t)
    local tkeys = {}
    -- populate the table that holds the keys
    for k in pairs(t) do tkeys[#tkeys + 1] = k end
    -- sort the keys
    table.sort(tkeys)
    -- use the keys to retrieve the values in the sorted order
    for _, k in ipairs(tkeys) do print(k, t[k]) end
end

orderedPairs(_G)
