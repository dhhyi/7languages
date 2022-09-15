(ns ss2_accounts
  (:gen-class))
(println "----------------")

(def accounts {:visa {:balance (ref 0) :type 'credit}
               :paypal {:balance (ref 100) :type 'debit}})

(defn dump []
  (doseq [[k v] accounts]
    (println k (deref (:balance v)))) (println "----"))

(dump)

(defn retrieve [account, amount]
  (println "Try retrieving" amount "from" (account :type) "with balance" (deref (account :balance)))
  (dosync
   (cond (or (= (:type account) 'credit)
             (>= @(:balance account) amount))
         (alter (:balance account) - amount)
         :else
         (println "Insufficient funds"))))

(retrieve (accounts :visa) 10)
(retrieve (accounts :paypal) 10)

(dump)

(retrieve (accounts :visa) 100)
(retrieve (accounts :paypal) 100)

(dump)

(defn deposit [account, amount]
  (println "Try depositing" amount "to" (account :type) "with balance" (deref (account :balance)))
  (dosync
   (cond (= (:type account) 'debit)
         (alter (:balance account) + amount)
         :else
         (println "Cannot deposit to credit account"))))

(deposit (accounts :visa) 1000)
(deposit (accounts :paypal) 1000)

(dump)