(ns ss3_sleepingbarber
  (:gen-class))
(println "----------------")

;; Agents are not suitable for synchronized state
;; TODO: redo with refs
;; see also https://github.com/cordmata/seven/blob/master/clojure/src/clojure_seven/barber.clj

(def r (java.util.Random. 2))
(defn random [n] (+ (.nextInt r n) 1))

(def factor 1)
(defn sleep [n] (Thread/sleep (* n factor)))

(def seats (agent 0))

(def arrived-customers (agent 0))
(def served-customers (agent 0))

(def customers (future (loop [i 0]
                         (if (< @seats 3)
                           (do
                             (send seats inc)
                             (println "Customer" i "is waiting")
                             (println "Number of seats taken:" (+ @seats))
                             (send arrived-customers inc))
                           (println "Customer" i "is not served"))
                         (sleep (+ 9 (random 20)))
                         (recur (inc i)))))

(def barber (future (loop [i 0]
                      (await seats)
                      (if (> @seats 0)
                        (do
                          (send seats dec)
                          (println "Barber is serving")
                          (sleep 20)
                          (send served-customers inc))
                        (println "Barber is sleeping"))
                      (recur (inc i)))))

(sleep 10000)

(future-cancel customers)
(future-cancel barber)

(println "----------------")

(println "Customers arrived:" @arrived-customers)
(println "Customers served:" @served-customers)
(println "Customers not served:" (- @arrived-customers @served-customers))
(println "Percentage of customers served:" (int (* 100 (/ @served-customers @arrived-customers))))
