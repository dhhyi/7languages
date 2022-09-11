(ns ss1_unlesselse
  (:gen-class))
(println "----------------")

;; (defmacro unless [condition & body] `(if (not ~condition) (do ~@body)))

(defmacro unless
  ([condition then] `(if (not ~condition) (do ~then)))
  ([condition then else] `(if (not ~condition) ~then ~else)))

(println (unless true (println "This shouldn't print")))
(println (unless false (println "This should print")))
(println (unless true (println "This shouldn't print") (println "This should print (else)")))
(println (unless false (println "This should print") (println "This shouldn't print (else)")))
