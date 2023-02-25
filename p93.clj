;; https://projecteuler.net/problem=93
;; for each 4 digits generate 5 * 4^3 * 4! = 7680 values
(def exprs
  [(fn [o1 o2 o3 ;; binary ops
        a b c d]
     (o1 (o2 (o3 a b) c) d)) ;; ((ab)c)d
   (fn [o1 o2 o3 a b c d]
     (o1 (o2 a (o3 b c)) d)) ;; (a(bc))d
   (fn [o1 o2 o3 a b c d]
     (o1 (o2 a b) (o3 c d))) ;; (ab)(cd)
   (fn [o1 o2 o3 a b c d]
     (o1 a (o2 (o3 b c) d))) ;; a((bc)d)
   (fn [o1 o2 o3 a b c d]
     (o1 a (o2 b (o3 c d)))) ;; a(b(cd))
   ])

(defn permutations [xs]
  (if (= 1 (count xs))
    (list xs)
    (for [head xs
          tail (permutations (disj (set xs) head))]
      (cons head tail))))

(defn pos-integer? [n]
  (and (integer? n) (> n 0)))

(defn longest-run' [nums last]
  (let [fst (first nums)]
    (if (not= (+ 1 last) fst)
     last
     (recur (rest nums) fst))))
(defn longest-run [nums] (longest-run' nums 0))

(def four-digits
  (for [x1 (range 1 10)
        x2 (range (inc x1) 10)
        x3 (range (inc x2) 10)
        x4 (range (inc x3) 10)]
    [x1 x2 x3 x4]))

(def ops-combos
  (let [ops [+ - / *]]
    (for [o1 ops o2 ops o3 ops] [o1 o2 o3])))

(def expr-fns
  (for [ops ops-combos
        expr exprs]
    (apply partial expr ops)))

(defn span [nums]
  (for [f expr-fns
        ns (permutations nums)]
    (try (apply f ns)
         (catch Exception e :nan))))

(defn span-distinct [nums]
  (->> (span nums)
       (filter pos-integer?)
       sort
       distinct))

(defn max-index [v]
  (first (apply max-key second
                (map-indexed vector v))))

(def longest-runs
  (map (comp longest-run span-distinct)
       four-digits))

(nth four-digits (max-index longest-runs));; => [1 2 5 8]
