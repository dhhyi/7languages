(ns atoms
  (:gen-class))
(println "----------------")

(def danger (atom "Split at your own risk"))
(println @danger)

(println "----------------")

(swap! danger str " " "or else")
(println @danger)

(println "----------------")

(reset! danger "Split with impunity")
(println @danger)

(println "----------------")

(def top-sellers (atom []))
(swap! top-sellers conj {:title "The Matrix"})
(swap! top-sellers conj {:title "The Matrix Reloaded"})

(println @top-sellers)

