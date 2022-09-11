(ns comprehension
  (:gen-class))
(println "----------------")

(def toys ["ball" "truck" "car"])
(def colors ["red" "green" "blue"])

(defn small-word [word]
  (< (count word) 5))

(println (for [toy toys, color colors] (str toy " " color "\n")))
(println (for [toy toys, color colors,
               :when (small-word color),
               :when (>= (count toy) 4)]
           (str toy " " color "\n")))
