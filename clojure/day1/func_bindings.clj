(ns func_bindings
  (:gen-class))
(println "----------------")

(def line [[0 0] [1 1]])

;; (defn line-end [line] (last line))
(defn line-end [[_ second]] second)

(println (line-end line))

(println "----------------")

(def tictactoe-board
  [[:x :o :x]
   [:o :c :o]
   [:x :o :x]])

(defn center-square1 [board] (nth (nth board 1) 1))
(println (center-square1 tictactoe-board))

(defn center-square2 [[_ [_ c _] _]] c)
(println (center-square2 tictactoe-board))

(defn center-square3 [[_ [_ c]]] c)
(println (center-square3 tictactoe-board))
