(ns functions
  (:gen-class))
(println "################")

(defn force-it "Force it!"
  [] (str "I'm a Jedi, " "let me use the force!"))

(println (force-it))
;; (println (doc force-it))

(println "----------------")

(defn force-it2 "Force it!"
  [name] (str "I'm a Jedi, " name ". Let me use the force!"))

(println (force-it2 "Luke"))
