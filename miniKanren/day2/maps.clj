(ns maps
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== run* fresh matche featurec conde]]))
(println "----------------")

(println (run* [q]
               (fresh [m]
                      (== m {:a 1 :b 2})
                      (matche [m]
                              ([{:a 1}] (== q :found-a))
                              ([{:b 2}] (== q :found-b))
                              ([{:a 1 :b 2}] (== q :found-both))))))

(println "----------------")

(println (run* [q] (featurec q {:a 1})))

(println (run* [q]
               (fresh [m a b]
                      (== m {:a 10 :b 20})
                      (conde
                       [(featurec m {:a a}) (== q [:found-a a])]
                       [(featurec m {:b b}) (== q [:found-b b])]
                       [(featurec m {:a a :b b}) (== q [:found-both a b])]))))
