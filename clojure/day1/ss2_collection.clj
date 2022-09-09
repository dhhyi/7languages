(ns ss2_collection
  (:gen-class))
(println "----------------")

(defn collection-type [coll]
  (cond
    (map? coll) :map
    (vector? coll) :vector
    (set? coll) :set
    (list? coll) :list
    :else (class coll)))

(println (collection-type [1 2 3]))
(println (collection-type #{1 2 3}))
(println (collection-type {:a 1 :b 2}))
(println (collection-type '(1 2 3)))
(println (collection-type "string"))
(println (collection-type (rest [1 2 3])))
