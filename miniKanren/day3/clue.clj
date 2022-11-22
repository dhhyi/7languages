(ns clue
  (:refer-clojure :exclude [==])
  (:require [clojure.core.logic :as logic])
  (:require [clojure.core.logic.pldb :as pldb]))
(println "----------------")

(def story-elements
  [[:maybe-telegram-girl :telegram-girl
    "A singing telegram girl arrives."]
   [:maybe-motorist :motorist
    "A stranded motorist comes asking for help."]
   [:motorist :policeman
    "Investigating an abandoned car, a policeman appears."]
   [:motorist :dead-motorist
    "The motorist is found dead in the lounge, killed by a wrench."]
   [:telegram-girl :dead-telegram-girl
    "The telegram girl is murdered in the hall with a revolver."]
   [:policeman :dead-policeman
    "The policeman is killed in the library with a lead pipe."]
   [:dead-motorist :guilty-mustard
    "Colonel Mustard killed the motorist, his old driver during the war."]
   [:dead-motorist :guilty-scarlet
    "Miss Scarlet killed the motorist to keep her secrets safe."]
   [:dead-motorist :guilty-peacock
    "Mrs. Peacock killed the motorist."]
   [:dead-telegram-girl :guilty-scarlet
    "Miss Scarlet killed the telegram girl so she wouldn't talk."]
   [:dead-telegram-girl :guilty-peacock
    "Mrs. Peacock killed the telegram girl."]
   [:dead-telegram-girl :guilty-wadsworth
    "Wadsworth shot the telegram girl."]
   [:dead-policeman :guilty-scarlet
    "Miss Scarlet tried to cover her tracks by murdering the policeman."]
   [:dead-policeman :guilty-peacock
    "Mrs. Peacock killed the policeman."]
   [:mr-boddy :dead-mr-boddy
    "Mr. Boddy's body is found in the hall beaten to death with a candlestick."]
   [:dead-mr-body :guilty-plum
    "Mr. Plum killed Mr. Boddy thinking he was the real blackmailer."]
   [:dead-mr-body :guilty-scarlet
    "Miss Scarlet killed Mr. Boddy to keep him quiet."]
   [:dead-mr-body :guilty-peacock
    "Mrs. Peacock killed Mr. Boddy."]
   [:cook :dead-cook
    "The cook is found stabbed in the kitchen."]
   [:dead-cook :guilty-scarlet
    "Miss Scarlet killed the cook to silence her."]
   [:dead-cook :guilty-peacock
    "Mrs. Peacock killed her cook, who used to work for her."]
   [:yvette :dead-yvette
    "Yvette, the maid, is found strangled with the rope in the billiard room."]
   [:dead-yvette :guilty-scarlet
    "Miss Scarlet killed her old employee, Yvette."]
   [:dead-yvette :guilty-peacock
    "Mrs. Peacock killed Yvette."]
   [:dead-yvette :guilty-white
    "Mrs. White killed Yvette, who had an affair with her husband."]
   [:wadsworth :dead-wadsworth
    "Wadsworth is found shot dead in the hall."]
   [:dead-wadsworth :guilty-green
    "Mr. Green, an undercover FBI agent, shot Wadsworth."]])

(pldb/db-rel ploto a b)

(def story-db
  (reduce (fn [dbase elems]
            (apply pldb/db-fact dbase ploto (take 2 elems)))
          (pldb/db)
          story-elements))

(def start-state
  [:maybe-telegram-girl :maybe-motorist
   :wadsworth :mr-boddy :cook :yvette])

(defn actiono [state new-state action]
  (logic/fresh [in out temp]
               (logic/membero in state)
               (ploto in out)
               (logic/rembero in state temp)
               (logic/conso out temp new-state)
               (logic/== action [in out])))

;; (println (pldb/with-db story-db
;;            (logic/run* [action state]
;;                        (actiono [:motorist] state action))))

(defn storyo* [start-state end-elems actions]
  (logic/fresh [action new-state new-actions]
               (actiono start-state new-state action)
               (logic/conso action new-actions actions)
               (logic/conda
                [(logic/everyg #(logic/membero % new-state) end-elems)
                 (logic/== new-actions [])]
                [(storyo* new-state end-elems new-actions)])))

(defn storyo [end-elems actions]
  (storyo* (shuffle start-state) end-elems actions))

;; (println (pldb/with-db story-db
;;            (logic/run 5 [q]
;;                       (storyo [:dead-wadsworth] q))))

(def story-map
  (reduce (fn [m elems]
            (assoc m (vec (take 2 elems)) (nth elems 2)))
          {}
          story-elements))

(defn print-story [actions]
  (println "PLOT SUMMARY:")
  (doseq [a actions]
    (println (story-map a))))

(def stories
  (pldb/with-db story-db
    (logic/run* [q]
                (storyo [:guilty-scarlet] q))))

;; (print-story (first (drop 10 stories)))

(defn story-stream [& goals]
  (pldb/with-db story-db
    (logic/run* [q] (storyo (vec goals) q))))

(print-story (first (filter #(> (count %) 11) (story-stream :guilty-wadsworth))))
