print "---------------"

local function retry(tries, func)
    for _ = 1, tries do
        local _, result = coroutine.resume(coroutine.create(func))

        if not result then
            return
        end
    end

    print("Failed to execute function")
end

retry(5, function()
    local willFail = math.random(1, 10) > 2
    print("will fail", willFail)
    if willFail then
        coroutine.yield("Failed")
    end

    print "Success"
end)
