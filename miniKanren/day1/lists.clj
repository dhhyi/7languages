(ns lists
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== run* run conso fresh conde]]))
(println "----------------")

(println (run* [q] (conso 1 [2 3] q)))
(println (run* [q] (conso 1 q [1 2 3])))
(println (run* [q] (fresh [h t] (conso h t [1 2 3]) (== q [h t]))))
(println (run* [h t] (conso h t [1 2 3])))

(println "----------------")

(defn insideo [e l]
  (conde
   [(fresh [t]
           (conso e t l))]
   [(fresh [h t]
           (conso h t l)
           (insideo e t))]))

(println (run* [q] (insideo q [1 2 3])))
(println (run 3 [q] (insideo 1 q)))
(println (run* [q] (insideo 4 [1 2 3 q])))
(println (run* [q] (insideo 4 [1 2 3 q 5 6 q])))
