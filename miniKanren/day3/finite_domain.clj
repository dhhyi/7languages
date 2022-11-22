(ns finite_domain
  (:require [clojure.core.logic :as logic])
  (:require [clojure.core.logic.fd :as fd]))
(println "----------------")

(println
 (logic/run* [q]
             (fd/in q (fd/interval 0 10))
             (fd/<= q 5)))

(println "----------------")

(println
 (logic/run* [x y z]
             (fd/in x y z (fd/interval 1 12))
             (fd/distinct [x y z])
             (fd/< x y)
             (fd/< y z)
             (fd/eq (= (+ x y z) 12))))
