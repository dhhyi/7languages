---@diagnostic disable: lowercase-global
print "-----------------"

scheduler = require "day2/scheduler"

function task1()
    local times = 8
    for i = 1, times do
        print("task1", i)
        if (i ~= times) then
            scheduler.wait(1)
        end
    end
end

function task2()
    local times = 3
    for i = 1, times do
        print("task2", i)
        if (i ~= times) then
            scheduler.wait(2)
        end
    end
end

scheduler.schedule(0.0, coroutine.create(task1))
scheduler.schedule(0.0, coroutine.create(task2))
scheduler.run()
