(ns destructuring
  (:gen-class))
(println "----------------")

(def person {:name "John" :age 25})

(let [{:keys [name age]} person]
  (println name "is" age "years old"))

(let [{name :name, age :age} person]
  (println name "is" age "years old"))
