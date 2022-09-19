(ns func_anon
  (:gen-class))
(println "----------------")

(def people ["lea" "han solo" "luke" "chewbacca"])

(println (map count people))

(println "----------------")

(defn twice-count [w]
  (* 2 (count w)))

(println (map twice-count people))

(println "----------------")

(println (map (fn [w] (* 2 (count w))) people))
(println (map #(* 2 (count %)) people))

(println "----------------")

(def random-numbers [4 6 2 8 1 9 3 5 7])

(println random-numbers)

(println (filter even? random-numbers))
(println (filter odd? random-numbers))

(println (apply + random-numbers))
(println (apply max random-numbers))

(println (filter #(>= % 5) random-numbers))
(println (filter #(>= 5 %) random-numbers))
