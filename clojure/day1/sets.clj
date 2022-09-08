(ns sets
  (:require [clojure.set :as set])
  (:gen-class))
(println "----------------")

(println #{:x-wing :y-wing :tie-fighter})

(println "----------------")

(def spacecraft #{:x-wing :y-wing :tie-fighter})

(println (count spacecraft))
(println (contains? spacecraft :x-wing))
(println (spacecraft :x-wing))
(println (spacecraft :z-95))
(println (empty? spacecraft))

(println "----------------")

(println (conj spacecraft :millenium-falcon))
(println (disj spacecraft :tie-fighter))
(println (set/union #{:x-wing :y-wing} #{:z-95 :tie-fighter}))

(println "----------------")

(println (sort spacecraft))
(println (sorted-set :x-wing :y-wing :tie-fighter))

(println "----------------")

(def spacecraft-sorted (sorted-set :x-wing :y-wing :tie-fighter))
(println spacecraft-sorted)
(println (conj spacecraft-sorted :millenium-falcon :z-95))
