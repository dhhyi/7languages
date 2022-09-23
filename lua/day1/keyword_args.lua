print "---------------"

function beer_prices(table)
    print("bitburger costs: " .. table.bitburger .. " euros")
end

beer_prices { bitburger = 2.50, heineken = 2.00 }

print "---------------"

prices = { bitburger = 2.50, heineken = 2.00, krombacher = "out" }

function lookup(beer, table)
    if table[beer] == "out"
    then
        print(beer .. " is out of stock")
    elseif table[beer]
    then
        print(beer .. " costs: " .. table[beer] .. " euros")
    else
        print("we don't sell " .. beer)
    end
end

lookup("bitburger", prices)
lookup("heineken", prices)
lookup("krombacher", prices)
lookup("radeberger", prices)
