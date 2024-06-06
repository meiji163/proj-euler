open Printf

(* partition list into increasing prefix and rest *)
let rec partition_inc acc list =
  let max = match acc with
    | [] -> 0
    | x :: rest -> x
  in
  match list with
    | [] -> (List.rev acc, list)
    | x :: rest ->
    if x >= max then
      partition_inc (x :: acc) rest
    else
      (List.rev acc, list)
;;

let rm_elem x list = List.filter (fun y -> y <> x) list
;;

let sort list = List.sort compare list
;;

(* next permuation in lexicographic order. *)
(* find the longest decreasing suffix ("tail"), then swap the next elem ("pivot") with *)
(* the next largest elem in the tail list. Then sort the tail ascending. e.g. *)
(*    [0;3;4;2;1] -> [0;3] [4;2;1] *)
(*                -> [0;4] [3;2;1] *)
(*                -> [0;4] [1;2;3] *)
(*                -> [0;4;1;2;3]   *)
let next_perm list =
  let tail_rev, rest_rev = partition_inc [] (List.rev list) in
  let pivot = List.hd rest_rev in
  let swap = List.find (fun x -> x > pivot) tail_rev in
  let new_tail_rev =
    sort (pivot :: (rm_elem swap tail_rev))
  in
  let new_rest_rev = swap :: (List.tl rest_rev) in
  (List.rev new_rest_rev) @ new_tail_rev
;;

let rec solve n list =
  if n = 1 then
    list
  else
    solve (n-1) (next_perm list)
;;

let () =
  let ans = solve 1000000 [0;1;2;3;4;5;6;7;8;9] in
  List.iter (printf "%d") ans
