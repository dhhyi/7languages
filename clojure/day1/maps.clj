(ns maps
  (:gen-class))
(println "----------------")

(println {:chewie "wookie" :luke "jedi" :han "smuggler"})

(def mentors {:darth-vader "obi-wan", :luke "yoda"})

(println "----------------")

(println mentors)
(println (get mentors :darth-vader))
(println (mentors :darth-vader))
(println (:darth-vader mentors))

(println "----------------")

(println (keys mentors))
(println (vals mentors))

(println "----------------")

(println (merge mentors {:han "chewie"}))

(println "----------------")

(def hangar {:x-wing 1, :tie-fighter 2, :y-wing 3})
(println (merge-with + hangar {:x-wing 10 :tie-fighter 10}))

(println "----------------")

(println (into {} (map (fn [[k v]] [k (str v " is awesome")]) mentors)))

(println "----------------")

(println (assoc {:one 1} :two 2))
(println (dissoc {:one 1 :two 2} :two))

(println "----------------")

(println (select-keys {:one 1 :two 2 :three 3} [:one :three]))

(println "----------------")

(println (sorted-map :one 1 :two 2 :three 3))
