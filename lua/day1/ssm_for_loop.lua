print "---------------------"

function for_loop(func, start, stop, step)
    if (start <= stop) then
        func(start)
        for_loop(func, start + (step or 1), stop, step)
    end
end

for_loop(function(i) print('at', i) end, 1, 4)

print "---------------------"

for_loop(print, 1, 4)

print "---------------------"

for_loop(print, 1, 10, 3)
