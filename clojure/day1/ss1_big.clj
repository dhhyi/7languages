(ns ss1_big
  (:gen-class))
(println "----------------")

(defn big [st n] (>= (count st) n))

(println (big "small" 4))
(println (big "big" 4))
