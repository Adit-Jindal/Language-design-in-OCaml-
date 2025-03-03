type exp =
| Intex of int
| Fltex of float
| Boolex of bool
| Addex of exp*exp
| Subex of exp*exp
| Mulex of exp*exp
| Divex of exp*exp
| Vectex of exp list
| Dotprodex of exp*exp
| Magex of exp
| Dimex of exp
| Anglex of exp*exp


module rec VectorOps : sig
  val sumElements : exp list -> exp
  val dotprod : exp list -> exp list -> exp
  val magnitude : exp list -> exp
  val addvec : exp list -> exp list -> exp
  val scalevec : exp -> exp list -> exp
  val dim : exp list -> exp
  val angle : exp list -> exp list -> exp
end = struct
  let rec sumElements v = let ans = match v with
    [a] -> a
    | a :: b :: c -> sumElements (Eval.eval (Addex(a,b)) :: c)
    | [] -> failwith "Empty vector"
    in ans
  let dotprod v1 v2 = List.map2 (fun e1 e2 -> Eval.eval (Mulex (e1, e2))) v1 v2
                      |> sumElements
  let magnitude v = List.map (Eval.eval) v
                    |> List.map (fun x -> Eval.eval (Mulex(x,x)))
                    |> sumElements
                    |> let rec numerical = function
                      Intex a -> Fltex (sqrt (float_of_int a))
                      | Fltex a -> Fltex (sqrt a)
                      | _ -> failwith "Not a valid numerical value"
                      in numerical
  let addvec v1 v2 = Vectex (List.map2 (fun a b -> (Eval.eval (Addex(a,b)))) v1 v2)
  let scalevec k v = Vectex (List.map (fun a -> Eval.eval (Mulex (a, k))) v)
  let rec dim v = let sum = Intex 0 in match v with
                        [a] -> Eval.eval (Addex (Intex 1, sum))
                        | a::aas -> Eval.eval (Addex ((Eval.eval (Addex (Intex 1, sum))), dim aas))
                        | _ -> failwith "Invalid vector for dimensions"
  let angle v1 v2 = let mag1= magnitude v1 in let mag2= magnitude v2 in
                        if (mag1=Fltex 0. || mag2=Fltex 0.) then failwith "Angle is not defined for zero vectors"
                        else let projection = dotprod v1 v2 in match projection with
                        Fltex f -> Eval.eval (Divex (projection, Eval.eval (Mulex (mag1, mag2))))
                        | Intex i -> Eval.eval (Divex (projection, Eval.eval (Mulex (mag1, mag2))))
                        | _ -> failwith "invalid dot product" (*------------------------GIVES COS OF ANGLE--------------------------------*)
  end

and Eval : sig
  val eval : exp -> exp
end = struct
  let rec eval = function
  | Intex n -> Intex n
  | Fltex f -> Fltex f
  | Boolex b -> Boolex b
  | Addex (a,b) -> let ans = match a,b with
      Intex a1, Intex b1 -> Intex (a1+b1)
      | Intex a1, Fltex b1 -> Fltex (float_of_int a1 +. b1)
      | Fltex a1, Intex b1 -> Fltex (a1 +. float_of_int b1)
      | Fltex a1, Fltex b1 -> Fltex (a1 +. b1)
      | Boolex b1, Boolex b2 -> Boolex (b1 || b2)
      | Vectex v1, Vectex v2 -> VectorOps.addvec v1 v2
      | _ , _ -> Addex(eval a, eval b)
      in ans
  | Subex (a,b) -> let ans = match a,b with
      Intex a1, Intex b1 -> Intex (a1-b1)
      | Intex a1, Fltex b1 -> Fltex (float_of_int a1 -. b1)
      | Fltex a1, Intex b1 -> Fltex (a1 -. float_of_int b1)
      | Fltex a1, Fltex b1 -> Fltex (a1 -. b1)
      | Boolex b1, Boolex b2 -> Boolex (b1 || not b2)
      | Fltex 0., Boolex b -> Boolex (not b)
      | Vectex v1, Vectex v2 -> eval (Addex (a, eval (Mulex(Fltex (-1.), b))))
      | _ , _ -> Subex(eval a, eval b)
      in ans
  | Mulex (a,b) -> let ans = match a,b with
      Intex a1, Intex b1 -> Intex (a1*b1)
      | Intex a1, Fltex b1 -> Fltex (float_of_int a1 *. b1)
      | Fltex a1, Intex b1 -> Fltex (a1 *. float_of_int b1)
      | Fltex a1, Fltex b1 -> Fltex (a1 *. b1)
      | Boolex b1, Boolex b2 -> Boolex (b1 && b2)
      | Intex k, Vectex v -> VectorOps.scalevec a v
      | Fltex k, Vectex v -> VectorOps.scalevec a v
      | _ , _ -> Mulex(eval a, eval b)
      in ans
  | Divex (a,b) -> let ans = match a,b with
      Intex a1, Intex b1 -> if b1=0 then
        failwith "Division with zero"
      else Intex (a1 / b1)
      | Intex a1, Fltex b1 -> if b1=0. then
        failwith "Division with zero"
      else Fltex (float_of_int a1 /. b1)
      | Fltex a1, Intex b1 -> if b1=0 then
        failwith "Division with zero"
      else Fltex (a1 /. float_of_int b1)
      | Fltex a1, Fltex b1 -> if b1=0. then
                failwith "Division with zero"
              else Fltex (a1 /. b1)
          | _ , _ -> Divex(eval a, eval b)
        in ans
  | Vectex v -> Vectex v
  | Dotprodex (v1,v2) -> let ans = match v1, v2 with
      Vectex va, Vectex vb -> VectorOps.dotprod va vb
      | _,_ -> failwith "Invalid type for dotprod"
      in ans
  | Magex v -> let ans = match v with
        Vectex v1 -> VectorOps.magnitude v1
        | _ -> failwith "Invalid type for magnitude"
    in ans
  | Dimex v -> let ans = match v with
        Vectex v1 -> VectorOps.dim v1
        | _ -> failwith "Invalid type for dimensions"
    in ans
  | Anglex (v1, v2) -> let ans = match v1,v2 with
        Vectex va, Vectex vb -> VectorOps.angle va vb
        | _,_ -> failwith "Invalid type for angle"
    in ans
  end
  
let eval = Eval.eval