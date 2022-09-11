(ns compass
  (:gen-class))
(println "----------------")

(defprotocol Compass
  (direction [c])
  (left [c])
  (right [c]))

(def directions [:north :east :south :west])

(defn turn [base amount] (rem (+ base amount) (count directions)))

(defrecord SimpleCompass [bearing]
  Compass
  (direction [_] (directions bearing))
  (left [_] (SimpleCompass. (turn bearing 3)))
  (right [_] (SimpleCompass. (turn bearing 1)))
  (toString [this] (str "SimpleCompass pointing at " (direction this))))


(def c (SimpleCompass. 0))
(println c)
(println (left c))
(println (right c))

(println (direction c))
(println (direction (left c)))
(println (direction (right c)))

(println (str c))

(println "----------------")

(def d (SimpleCompass. 2))
(println d)
(println (str d))
(println (direction d))
(println (:bearing d))
(println (directions (:bearing d)))

(println "----------------")

(def e (SimpleCompass. 2))
(println (str d))
(println (str e))
(println "=?" (= d e))
