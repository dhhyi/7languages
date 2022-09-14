(ns references
  (:gen-class))
(println "----------------")

(def movie (ref "Movie"))

(println (deref movie))
(println @movie)

(println "----------------")

(dosync (alter movie str ": Sequel"))
(println @movie)

(println "----------------")

(dosync (ref-set movie "Movie 2"))
(println @movie)
