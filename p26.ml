let rec range a b =
  if a > b then []
  else a :: range (a + 1) b
;;

let is_prime n =
  let rec loop i =
    if i*i > n then
      true
    else if (n mod i = 0) then
      false
    else
      loop (i+1)
  in
  loop 2
;;

(* find the period of 1/n *)
(* the period is the smallest p>0 such that n divides 10^p - 1 *)
let period n =
  let rec loop exp pow =
    let rem = pow mod n in
    if rem = 0 then
      0
    else if rem = 1 then
      exp
    else
      loop (exp + 1) ((10 * pow) mod n)
  in
  loop 1 10
;;

let zip_map fn list =
  List.combine list (List.map fn list)
;;

let solve max =
  let r = List.filter is_prime (range 1 max) in
  (* sort descending *)
  let by_second t1 t2 =
    - (compare (snd t1) (snd t2))
  in
  let sorted =
    List.sort by_second
      (zip_map period r)
  in
  List.hd sorted
;;

let () =
  let ans = solve 1000 in
  print_int (fst ans);
