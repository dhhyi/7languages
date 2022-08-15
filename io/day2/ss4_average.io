"---------------" println

List myAverage := method(
    if (self size == 0, return nil)
    self foreach(i, if(i proto != Number, Exception raise("non-number in list")))
    self sum / self size
)

list() myAverage println
list(1,2,3,4) myAverage println
list(1,2,4) myAverage println
list(1,"2",4) myAverage println
