(ns lazyeval
  (:gen-class))
(println "----------------")

(println (range 10))
(println (range 1 10))
(println (range 1 10 3))

(println "----------------")

(println (take 3 (range 10)))
(println (take 3 (repeat "hi")))

(println "----------------")

(println (take 7 (cycle [1 2 3])))
(println (take 7 (cycle [:eat :sleep :code])))
(println (take 7 (drop 2 (cycle [:eat :sleep :code]))))

(println "----------------")

(println (->> (range 3) (cycle) (drop 2) (take 7)))

(println "----------------")

(println (take 5 (interpose :and [1 2 3 4 5])))

(println "----------------")

(println (take 20 (cycle (interleave [1 2 3 4] [:a :b :c]))))
(println (take 20 (interleave (cycle [1 2 3 4]) (cycle [:a :b :c]))))

(println "----------------")

(println (take 10 (iterate inc 0)))
(println (take 10 (iterate dec 0)))
(println (take 10 (iterate (fn [x] (* 2 x)) 1)))

(println "----------------")

(println (take 10 (repeatedly #(rand-int 100))))
(println (take 10 (repeat 1)))
