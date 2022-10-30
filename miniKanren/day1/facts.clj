(ns facts
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== run* fresh conde]])
  (:require [clojure.core.logic.pldb :refer [db db-rel with-db db-fact]]))
(println "----------------")

(db-rel mano x)
(db-rel womano x)

(def facts (db
            [mano :john]
            [womano :alice]
            [mano :egon]
            [womano :karen]
            [mano :bob]
            [womano :lisa]
            [mano :jim]
            [womano :mary]))

(println (with-db facts (run* [q] (womano q))))
(println (with-db facts (run* [q] (mano q))))

(println "----------------")

(db-rel ageo x a)

(db-rel engineero x b)

(def facts (-> facts
               (db-fact ageo :karen 30)
               (db-fact ageo :alice 25)
               (db-fact ageo :mary 20)
               (db-fact ageo :lisa 21)
               (db-fact ageo :egon 35)
               (db-fact ageo :bob 40)
               (db-fact ageo :jim 23)
               (db-fact ageo :john 45)
               (db-fact engineero :karen :yes)
               (db-fact engineero :alice :no)
               (db-fact engineero :mary :yes)
               (db-fact engineero :lisa :yes)
               (db-fact engineero :egon :yes)
               (db-fact engineero :bob :no)
               (db-fact engineero :jim :no)
               (db-fact engineero :john :yes)))

(println (with-db facts (run* [q]
                              (engineero q :yes))))

(println "----------------")

(println (with-db facts (run* [q]
                              (womano q)
                              (ageo q 21)
                              (engineero q :yes))))

(println (with-db facts (run* [n a]
                              (ageo n a)
                              (engineero n :yes)
                              (conde
                               [(mano n)]
                               [(womano n)]))))
