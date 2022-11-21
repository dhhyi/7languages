(ns lists_matche
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [run* run conde fresh conso matche == !=]]))

(println "----------------")

;; (defn insideo [e l]
;;   (matche [l]
;;           ([[e . _]])
;;           ([[_ . t]] (insideo e t))))

;; (defne insideo [e l]
;;   ([_ [e . _]])
;;   ([_ [_ . t]] (insideo e t)))

(defn insideo [e l]
  (conde
   [(fresh [t]
           (conso e t l))]
   [(fresh [h t]
           (conso h t l)
           (insideo e t)
           (!= e h))]))

(println (run* [q] (insideo q [1 2 3])))
(println (run 3 [q] (insideo 1 q)))
(println (run* [q] (insideo 4 [1 2 3 q])))
(println (run* [q] (insideo 4 [1 2 3 q 5 6 q])))

(println "----------------")

(println (run* [q] (insideo 1 [1 2 1])))
(println (run* [q] (insideo q [1 2 1])))
