let isqrt : int -> int =
  fun x ->
  x |> float_of_int |> sqrt |> int_of_float
;;

(* The shortest path length is sqrt(a^2 + (b+c)^2) *)
(* where a >= b >= c. *)
let is_solution a b c =
  let x = a*a + (b+c)*(b+c) in
  let r = isqrt x in
  r*r = x
;;


(* increase max sidelength until given number of *)
(* solutions are found, and return max sidelength *)
let solve num_soln =
  let max = ref 0 in
  let count = ref 0 in
  let () =
    while !count <= num_soln do
      max := !max + 1;
      let a = !max in
      for b = a downto 1 do
        for c = b downto 1 do
          if is_solution a b c then
            count := !count + 1
          else ();
        done
      done
    done
  in !max
;;

let () =
  let ans = solve 1000000 in
  print_int ans
