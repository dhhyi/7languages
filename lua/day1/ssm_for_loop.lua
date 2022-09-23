print "---------------------"

print "-- if"

function for_loop_if(func, start, stop, step)
    if (start <= stop) then
        func(start)
        for_loop_if(func, start + (step or 1), stop, step)
    end
end

for_loop_if(function(i) print('at', i) end, 1, 4)

print "--"

for_loop_if(print, 1, 10, 3)

print "-- while"

function for_loop_while(func, start, stop, step)
    while (start <= stop) do
        func(start)
        start = start + (step or 1)
    end
end

for_loop_while(function(i) print('at', i) end, 1, 4)

print "--"

for_loop_while(print, 1, 10, 3)
