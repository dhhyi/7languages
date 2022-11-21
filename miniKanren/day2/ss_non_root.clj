(ns ss_non_root
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :refer [== != run* featurec fresh]]))
(println "----------------")

(def user1 {:username "john" :location "home"})
(def user2 {:username "root" :location "everywhere"})

(defn non-rooto [m] (fresh [u] (featurec m {:username u}) (!= u "root")))

(println (run* [q] (non-rooto user1)))
(println (run* [q] (non-rooto user2)))
