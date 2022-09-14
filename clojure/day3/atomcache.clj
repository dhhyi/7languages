(ns atomcache
  (:gen-class))
(println "----------------")

(defn create [] (atom {}))

(defn retrieve [cache key]
  (@cache key))

(defn put
  ([cache value-map] (swap! cache merge value-map))
  ([cache key value] (swap! cache assoc key value)))

(def ac (create))
(put ac :a 1)

(println (retrieve ac :a))

(put ac :a 2)

(println (retrieve ac :a))