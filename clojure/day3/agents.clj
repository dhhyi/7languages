(ns agents
  (:gen-class))
(println "----------------")

(defn twice [x] (* x 2))

(def tribbles (agent 1))

(println @tribbles)

(send tribbles twice)

(println @tribbles)

(println "----------------")

(defn slow-twice [x]
  #_{:clj-kondo/ignore [:redundant-do]}
  (do (Thread/sleep 5000)
      (* x 2)))

(send tribbles slow-twice)

(println @tribbles)

(println "waiting 6 seconds...")
(Thread/sleep 6000)

(println @tribbles)

(println "----------------")

(send tribbles slow-twice)
(println "waiting for slow-twice to finish...")
(await tribbles)

(println @tribbles)
