(println "----------------")

(println (vector :hutt :wookie :ewok))
(println [:hutt :wookie :ewok])

(println "----------------")

(def myvector [:hutt :wookie :ewok])

(println (first myvector))
(println (last myvector))
(println (rest myvector))
(println (cons :droid myvector))
(println (conj myvector :droid))

(println "----------------")

(println (nth myvector 2))

(println "----------------")

(println myvector)
(println (list* myvector))

(println "----------------")

(println (concat myvector [:droid :jawa]))
(println (class (concat myvector [:droid :jawa])))
(println (class (vector :hutt :wookie :ewok)))
