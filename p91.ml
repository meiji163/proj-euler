(* Cartesian product of 2 lists *)
let cartesian2 lst1 lst2 =
  List.concat
    (List.map (fun x -> (List.map (fun y -> (x,y)) lst2)) lst1)
;;

let rec range a b =
  if a > b then []
  else a :: range (a + 1) b
;;

let coords n =
  let r = range 0 n in
  let xy = cartesian2 r r in

  let interleave prs =
    let ((x1,x2),(y1,y2)) = prs in (x1,y1,x2,y2)
  in

  (* ensure (x2,y2) is above the line spanned by (x1,y1)*)
  let filter_tup tup =
    let (x1,y1,x2,y2) = tup in
    (x1 != 0 || y1 != 0) &&
    (x2 != 0 || y2 != 0) &&
    (y2 * x1 > y1 * x2)
  in
  List.filter filter_tup (List.map interleave (cartesian2 xy xy))
;;

(* check if (0,0) (x1,y1) (x2,y2) forms a right triangle *)
let is_right_tri crds =
  let (x1,y1,x2,y2) = crds in
  let
    diffx = x1 - x2 and diffy = y1 - y2
  in
  (x1 * x2 + y1 * y2 = 0) ||
  (diffx * x1 + diffy * y1 = 0) ||
  (diffx * x2 + diffy * y2 = 0)
;;

let solve n =
  let crds = coords n in
  List.length (List.filter is_right_tri crds)
;;

let () =
  let n = solve 50 in print_int n
