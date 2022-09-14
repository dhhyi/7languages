(ns ss1_blockingqueue
  (:gen-class))
(println "----------------")

;; https://clojuredocs.org/clojure.core/seque

(let [start (System/nanoTime)
      q (seque
         (iterate
          #(do (Thread/sleep 400) (inc %))
          0))]
  (println "sleep five seconds...")
  (Thread/sleep 5000)
  (doseq [i (take 20 q)]
    (println (int (/ (- (System/nanoTime) start) 1e7))
             ":" i)))
