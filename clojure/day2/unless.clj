(ns unless
  (:gen-class))
(println "----------------")

;; (defn unless [condition, body] (if (not condition) body, nil))

;; (defn unless [condition & body] (if (not condition) (do body)))

;; (defmacro unless [condition & body] `(if (not ~condition) (do ~@body)))

(defmacro unless [test body] (list 'if (list 'not test) body))

(println (unless true (println "This shouldn't print")))
(println (unless false (println "This should print")))
