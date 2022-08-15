"--------------" println

OperatorTable addOperator("div", 2)
Object div := method(div, 
    if(div == 0, 0, self / div)
)

(1 div(0)) println
(10 div(5)) println

