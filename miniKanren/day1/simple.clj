(ns simple
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== run* membero run]]))
(println "----------------")

(println (run* [q] (== q 1)))
(println (run* [q] (== q 1) (== q 2)))

(println "----------------")

(println (run* [q] (membero q [1 2 3])))
(println (run* [q] (membero q [1 2 3]) (membero q [2 3 4])))

(println (run 2 [q] (membero q [1 2 3])))

(println "----------------")

(println (run 3 [q] (membero [1 2 3] q)))
