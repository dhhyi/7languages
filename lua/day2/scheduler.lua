local pending = {}

setmetatable(pending, {
    __tostring = function(t)
        local s = ""
        for k, v in pairs(t) do
            s = s .. (k or 'nil') .. "\n"
            print(v)
        end
        return s
    end
})

local function schedule(time, action)
    -- print("schedule", time, action)
    pending[#pending + 1] = { time = time, action = action }
end

local function wait(duration)
    coroutine.yield(duration)
end

local function remove_first(t)
    local first = t[1]
    t[1] = t[#t]
    t[#t] = nil
    return first
end

local function run()
    while #pending > 0 do
        table.sort(pending, function(a, b) return a.time < b.time end)

        while os.clock() < pending[1].time do end

        local next = remove_first(pending)
        local _, seconds = coroutine.resume(next.action)

        if seconds then
            schedule(os.clock() + seconds, next.action)
        end
    end
    print "done"
end

return {
    schedule = schedule,
    wait = wait,
    run = run,
}
