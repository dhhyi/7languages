
(println "----------------")

(println (list 1 2 3 4 5))
(println '(1 2 3 4 5))

(println "----------------")

(def mylist '(1 2 3 4 5))

(println (first mylist))
(println (last mylist))
(println (rest mylist))
(println (cons 0 mylist))
(println (conj mylist 6 7 8))
(println (list* mylist '(6 7 8)))
