(ns futures
  (:gen-class))
(println "----------------")

(println "finer things")

(def finer-things (future (Thread/sleep 5000) "take time"))

(Thread/sleep 2000)
(println "possibly")

(println @finer-things)

(println "on second")

(println @finer-things)