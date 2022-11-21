(ns ss_which_reverse
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== run* conda all membero]]))
(println "----------------")

(defn whicho [e l1 l2 r]
  (conda
   [(all (membero e l1) (membero e l2) (== r :both))]
   [(all (membero e l1) (== r :first))]
   [(all (membero e l2) (== r :second))]))

(println (run* [q] (whicho q [1 2 3 4] [3 4 5] :first)))
(println (run* [q] (whicho q [1 2 3 4] [3 4 5] :second)))
(println (run* [q] (whicho q [1 2 3 4] [3 4 5] :both)))
