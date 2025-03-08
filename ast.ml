type exp =
| Intex of int
| Fltex of float
| Boolex of bool
| Letex of string*exp
| Varex of string
| Equex of exp*exp
| Lessex of exp*exp
| Morex of exp*exp
| Addex of exp*exp
| Subex of exp*exp
| Mulex of exp*exp
| Divex of exp*exp
| Vectex of exp list
| Dotprodex of exp*exp
| Magex of exp
| Dimex of exp
| Anglex of exp*exp
| Seqex of exp list
| Cndex of exp*exp*exp
| Forex of exp*exp*exp*exp
| Foldex of exp

let var_list : (string*exp) list ref = ref []

module rec VectorOps : sig
  val sumElements : exp list -> exp
  val minor : exp list -> int -> int -> exp list
  val determinant : exp list -> exp
  val fold_cnd : exp -> exp
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
  let minor matrix i j = (* RETURNS A LIST OF LISTS, AND NOT AN EXP, UNLIKE ALL OTEHR FUNCTIONS*)
    let rec remove_row m i = match m with
      [] -> []
      | row::rest -> if i=0 then rest else row::(remove_row rest (i-1))
    in
    let rowless_m = remove_row matrix i in
    List.map (fun x -> match x with (Vectex row) -> Vectex ((List.filteri (fun ix _ -> ix <> j) row)) | _ -> failwith "Expected a vector expression") rowless_m
  let rec determinant m = match m with
    [] -> Intex 0
    | [Vectex [x]] -> x
    | _ ->
      let rec cofactor_exp m index row = match row with
        Vectex [] -> Intex 0
        | Vectex (head::rest) ->
          let sign = if index mod 2 = 0 then Intex 1 else Intex (-1) in
          let min_det = determinant (minor m 0 index) in
          Eval.eval (Addex(Eval.eval (Mulex(Eval.eval (Mulex(sign, head)), min_det)), cofactor_exp m (index+1) (Vectex rest)))
        | _ -> failwith "Invalid row syntax"
      in cofactor_exp m 0 (List.hd m)
  let rec fold_cnd e = let ans = match e with (*Takes in a Seqex of boolean exp and returns a Boolex exp*)
    Seqex v -> let final = match v with
      | [b] -> Eval.eval b
      | b1::b2::b -> let folded = ((Eval.eval (Mulex (b1,b2)))::b) in List.hd folded
      | _ -> failwith "Folding a sequencing is defined only for non-empty boolean sequences"
      in final
    | _ -> failwith "Fold is defined only for seqences"
  in ans
  let dotprod v1 v2 = List.map2 (fun e1 e2 -> Eval.eval (Mulex (e1, e2))) v1 v2
                      |> sumElements
  let magnitude v = let ans = match v with
                    Vectex a :: v1 -> if List.for_all (fun x -> (Eval.eval (Dimex x) = VectorOps.dim v)) v then determinant v
                                      else failwith "Not a square matrix"
                    | _ -> List.map (Eval.eval) v
                      |> List.map (fun x -> Eval.eval (Mulex(x,x)))
                      |> sumElements
                      |> let rec numerical = function
                        Intex a -> Fltex (sqrt (float_of_int a))
                        | Fltex a -> Fltex (sqrt a)
                        | _ -> failwith "Not a valid numerical value"
                        in numerical
                    in ans
  let addvec v1 v2 = Vectex (List.map2 (fun a b -> (Eval.eval (Addex(a,b)))) v1 v2)
  let scalevec k v = Vectex (List.map (fun a -> Eval.eval (Mulex (k, a))) v)
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
  | Equex (a,b) -> if ((eval a)=(eval b)) then Boolex true else Boolex false
  | Lessex (a, b) -> if ((eval a) <(eval b)) then Boolex true else Boolex false
  | Morex (a, b) -> if ((eval a) >(eval b)) then Boolex true else Boolex false
  | Addex (a,b) -> let ans = match eval a,eval b with
      Intex a1, Intex b1 -> Intex (a1+b1)
      | Intex a1, Fltex b1 -> Fltex (float_of_int a1 +. b1)
      | Fltex a1, Intex b1 -> Fltex (a1 +. float_of_int b1)
      | Fltex a1, Fltex b1 -> Fltex (a1 +. b1)
      | Boolex b1, Boolex b2 -> Boolex (b1 || b2)
      | Vectex v1, Vectex v2 -> VectorOps.addvec v1 v2
      | _ , _ -> Addex(eval a, eval b)
      in ans
  | Subex (a,b) -> let ans = match eval a, eval b with
      Intex a1, Intex b1 -> Intex (a1-b1)
      | Intex a1, Fltex b1 -> Fltex (float_of_int a1 -. b1)
      | Fltex a1, Intex b1 -> Fltex (a1 -. float_of_int b1)
      | Fltex a1, Fltex b1 -> Fltex (a1 -. b1)
      | Boolex b1, Boolex b2 -> Boolex (b1 || not b2)
      | Fltex 0., Boolex b -> Boolex (not b)
      | Vectex v1, Vectex v2 -> eval (Addex (a, eval (Mulex(Fltex (-1.), b))))
      | _ , _ -> Subex(eval a, eval b)
      in ans
  | Mulex (a,b) -> let ans = match eval a, eval b with
      Intex a1, Intex b1 -> Intex (a1*b1)
      | Intex a1, Fltex b1 -> Fltex (float_of_int a1 *. b1)
      | Fltex a1, Intex b1 -> Fltex (a1 *. float_of_int b1)
      | Fltex a1, Fltex b1 -> Fltex (a1 *. b1)
      | Boolex b1, Boolex b2 -> Boolex (b1 && b2)
      | Intex k, Vectex v -> VectorOps.scalevec a v
      | Fltex k, Vectex v -> VectorOps.scalevec a v
      | Vectex v, Intex k -> VectorOps.scalevec b v
      | Vectex v, Fltex k -> VectorOps.scalevec b v
      | _ , _ -> Mulex(eval a, eval b)
      in ans
  | Divex (a,b) -> let ans = match eval a, eval b with
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
  | Vectex v -> let res = match v with
      Vectex a :: v1 -> let n = VectorOps.dim a in
        if List.for_all (fun x -> (Eval.eval (Dimex (eval x))) = n) v then Vectex v
        else failwith "Unequal dimensions in constituent vectors in matrix"
      | _ -> Vectex (List.map (fun x -> eval x) v)
      in res
  | Dotprodex (v1,v2) -> let ans = match eval v1, eval v2 with
      Vectex va, Vectex vb -> VectorOps.dotprod va vb
      | _,_ -> failwith "Invalid type for dotprod"
      in ans
  | Magex v -> let ans = match eval v with
        Intex i -> if i>0 then Intex i else Intex (0-i)
        | Fltex f -> if f>0. then Fltex f else Fltex (0.-.f)
        | Vectex v1 -> VectorOps.magnitude v1
        | _ -> failwith "Invalid type for magnitude"
    in ans
  | Dimex v -> let ans = match eval v with
        Vectex v1 -> VectorOps.dim v1
        | _ -> failwith "Invalid type for dimensions"
    in ans
  | Anglex (v1, v2) -> let ans = match eval v1, eval v2 with
        Vectex va, Vectex vb -> VectorOps.angle va vb
        | _,_ -> failwith "Invalid type for angle"
    in ans
  | Seqex v -> Seqex (List.map (fun x -> eval x) v)
  | Cndex (a, b, c) -> let ans = match eval a with
    Boolex true -> eval b
    | Boolex false -> eval c
    | Seqex v -> if VectorOps.fold_cnd (eval a)=Boolex true then eval b else eval c
    | _ -> failwith "First argument to a conditional must evaluate to a boolean"
  in ans
  | Letex (v, e) -> let value = eval e in var_list := (v, value) :: !var_list; Letex(v, value);
  | Varex v -> List.assoc v !var_list
  | Forex (i,c,u,s) -> let res_i = eval (eval i) in
                                            let next_step = match u,s with
                                              Seqex u1, Seqex s1 -> s1@u1
                                              | _, _ -> failwith "Inconsistent expressions in update or execution statements"
                                            in
                                              if ((VectorOps.fold_cnd (eval (eval c)))=Boolex true) then eval (Forex (Seqex next_step, c, Seqex next_step, Seqex []))
                                              else res_i
  | Foldex e -> e
  end
  
let eval = Eval.eval