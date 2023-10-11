let pentagonal k = (k * (3 * k - 1)) / 2

(** Compute partitions n using Euler's pentagonal recurrence *)
(** given that arr.(i) = partitions i for 0 <= i < n *)
let step arr n =
  let rec loop acc k =
    let pt1 = pentagonal k in
    let pt2 = pentagonal (-k) in
    let sgn = if k mod 2 = 0 then -1 else 1 in

    (* note: pt1 < pt2 *)
    if pt1 > n then acc
    else if pt2 > n then
      let add = (sgn * arr.(n - pt1)) in (acc + add)
    else
      let add = sgn * (arr.(n - pt1) + arr.(n - pt2)) in
        loop (acc + add) (k + 1)
  in
  loop 0 1
;;

let modulus = 1000000

let solve1 max =
  let partitions_arr = Array.make max 0 in
  partitions_arr.(0) <- 1;
  let rec loop n =
    if n >= max then None else

    let p_n = step partitions_arr n in
    let p_n_mod = p_n mod modulus in
    if p_n_mod = 0 then Some n else
    begin
        partitions_arr.(n) <- p_n_mod;
        loop (n + 1)
    end
  in
  loop 1
;;

let () =
  match solve1 100000 with
  | None -> print_string "TRY AGAIN"
  | Some n -> print_int n
