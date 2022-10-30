(ns sse_append
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== run* run appendo fresh]]))
(println "----------------")

(println (run* [q]
               (appendo '(1 2 3 4 5) '(6 7 8 9 10) q)))

(println (run* [q]
               (fresh [l1 l2]
                      (appendo l1 l2 '(1 2 3 4 5))
                    ;;   (== l1 '(1 2))
                      (== q [l1 l2]))))

(println (run* [q r]
               (appendo q r '(1 2 3 4 5))))

(println "----------------")

(println (run 1 [q]
              (appendo q q '(1 2 3 4 5))))

(println (run 1 [q]
              (appendo q q '(1 2 3 1 2 3))))
