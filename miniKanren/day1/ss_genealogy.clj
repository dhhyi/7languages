(ns ss_genealogy
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [!= run* conde fresh]])
  (:require [clojure.core.logic.pldb :refer [db db-rel with-db]]))
(println "----------------")

(db-rel mano x)
(db-rel womano x)

(db-rel marriedo x y)
(db-rel childofo mother child)

(def facts (db
            [mano :john]
            [womano :patricia]
            [mano :bob]
            [womano :alice]
            [mano :egon]
            [womano :karen]
            [mano :tim]
            [womano :lisa]
            [womano :mary]
            [mano :jim]

            [marriedo :john :patricia]
            [marriedo :bob :alice]
            [marriedo :karen :egon]
            [marriedo :jim :mary]

            [childofo :patricia :alice]
            [childofo :patricia :egon]
            [childofo :alice :tim]
            [childofo :karen :mary]
            [childofo :alice :lisa]))

(print "wives: ")
(println (with-db facts (run* [q]
                              (womano q)
                              (conde
                               [(fresh [hb] (marriedo q hb))]
                               [(fresh [hb] (marriedo hb q))]))))

(print "siblings: ")
(println (with-db facts (run* [l r]
                              (fresh [mother]
                                     (childofo mother l)
                                     (childofo mother r)
                                     (!= l r)))))

(print "fathers: ")
(println (with-db facts (run* [father]
                              (fresh [mother child]
                                     (childofo mother child)
                                     (conde
                                      [(marriedo father mother)]
                                      [(marriedo mother father)])))))
