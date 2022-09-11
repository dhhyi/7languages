(ns fibonacci
  (:gen-class))

;; (defn fib [n]
;;   (if (<= n 1) 1
;;       (+ (fib (- n 1)) (fib (- n 2)))))

(defn fib-pair [[a,b]] [b, (+ a b)])
(defn fib-sequence [] (map first (iterate fib-pair [1,1])))
(defn fib [n] (nth (fib-sequence) n))

(println "----------------")

;; (println (take 25 (fib-sequence)))
(println (time (fib 40)))

;; (println "----------------")

;; (defn factorial [n] (reduce * (range 1 (inc n))))
;; (defn factorial [n] (apply * (take n (iterate inc 1))))

;; (println (factorial 5))

;; (println "----------------")

;; https://medium.com/@omarnyte/understanding-function-returns-and-recursion-in-clojure-dc457480a386
;; 
;; (defn fib-seq
;;   ([n]
;;    (fib-seq n [1 1]))
;;   ([n vec]
;;    (if (> (count vec) n)
;;      vec
;;      (recur n
;;             (conj vec (+ (nth vec (- (count vec) 2))
;;                          (last vec)))))))

;; (println (fib-seq 20))
