(ns cond
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== run* conde membero conda all condu fresh conso]]))
(println "----------------conde")

(defn whicho [e l1 l2 r]
  (conde
   [(membero e l1) (membero e l2) (== r :both)]
   [(membero e l1) (== r :first)]
   [(membero e l2) (== r :second)]
   [(== r :neither)]))

(println (run* [q] (whicho 1 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 5 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 3 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 7 [1 2 3] [3 4 5] q)))

(println "----------------conda")

(defn whicho [e l1 l2 r]
  (conda
   [(all (membero e l1) (membero e l2) (== r :both))]
   [(membero e l1) (== r :first)]
   [(membero e l2) (== r :second)]
   [(== r :neither)]))

(println (run* [q] (whicho 1 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 5 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 3 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 7 [1 2 3] [3 4 5] q)))

(println "----------------condu")

(defn whicho [e l1 l2 r]
  (condu
   [(all (membero e l1) (membero e l2) (== r :both))]
   [(membero e l1) (== r :first)]
   [(membero e l2) (== r :second)]
   [(== r :neither)]))

(println (run* [q] (whicho 1 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 5 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 3 [1 2 3] [3 4 5] q)))
(println (run* [q] (whicho 7 [1 2 3] [3 4 5] q)))

(println "----------------insideo conde")

(defn insideo [e l]
  (conde
   [(fresh [h t] (conso h t l) (== e h))]
   [(fresh [h t] (conso h t l) (insideo e t))]))

(println (run* [q] (insideo q [1 2 3])))

(println "----------------insideo conda")

(defn insideo [e l]
  (conda
   [(fresh [h t] (conso h t l) (== e h))]
   [(fresh [h t] (conso h t l) (insideo e t))]))

(println (run* [q] (insideo q [1 2 3])))

(println "----------------insideo condu")

(defn insideo [e l]
  (condu
   [(fresh [h t] (conso h t l) (== e h))]
   [(fresh [h t] (conso h t l) (insideo e t))]))

(println (run* [q] (insideo q [1 2 3])))
