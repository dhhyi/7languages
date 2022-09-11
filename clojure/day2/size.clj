(ns size
  (:gen-class))
(println "----------------")

;; (defn size [coll]
;;   (if (empty? coll) 0
;;       (inc (size (rest coll)))))

(defn size [coll]
  (loop [l coll, acc 0]
    (println l acc)
    (if (empty? l) acc
        (recur (rest l) (inc acc)))))

(defn print-size [coll]
  (println "Size of" coll "is" (size coll)))

(print-size [1 2 3 4 5 6])
(print-size #{1 2 3 4 5 6})
(print-size "string")
(print-size '(1 2 3 4 5 6))
(print-size {:a 1 :b 2 :c 3 :d 4 :e 5 :f 6})

(defn loop-me [num]
  (loop [n num]
    (println 'at n)
    (if (zero? n) :done
        (recur (dec n)))))

(println (loop-me 10))
