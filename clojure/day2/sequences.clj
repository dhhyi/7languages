(ns sequences
  (:gen-class))
(println "----------------")

(println (every? even? [2 4 6 8 10]))
(println (every? even? [2 4 6 8 11]))

(println (some nil? [1 3 5 7 9]))
(println (some nil? [1 3 5 7 nil]))

(println (not-every? even? [1 3 5 7 9]))
(println (not-every? odd? [1 3 5 7 9]))

(println (not-any? number? [1 3 5 7 9]))
(println (not-any? number? [:one :three :five :seven :nine]))

(println "----------------")

(def words ["the" "quick" "brown" "fox" "jumped" "over" "the" "lazy" "dog"])
(println (filter #(> (count %) 4) words))

(println "----------------")

(println (map inc [1 2 3 4 5]))
(println (map #(* % %) [1 2 3 4 5]))
(println (map #(* % % %) [1 2 3 4 5]))

(defn exp [x n]
  (loop [acc 1 n n]
    (if (zero? n) acc
        (recur (* x acc) (dec n)))))

(println (map #(exp 2 %) [1 2 3 4 5 6 7 8]))

(println "----------------")

(println (reduce + [1 2 3 4 5]))
(println (sort [2 3 6 4 5 1]))

(println "----------------")

(defn absolute [x]
  (if (< x 0) (- x) x))

(println (sort [-1 -2 -3 4 5 -6]))
(println (sort-by absolute [-1 -2 -3 4 5 -6]))
