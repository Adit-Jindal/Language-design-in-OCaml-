type exp =
| Intex of int
| Fltex of float
| Addex of exp*exp
| Subex of exp*exp
| Mulex of exp*exp
| Divex of exp*exp
| Vectex of exp list

let rec eval = function
| Intex n -> Intex n
| Fltex f -> Fltex f
| Addex (a,b) -> let ans = match a,b with
    Intex a1, Intex b1 -> Intex (a1+b1)
    | Intex a1, Fltex b1 -> Fltex (float_of_int a1 +. b1)
    | Fltex a1, Intex b1 -> Fltex (a1 +. float_of_int b1)
    | Fltex a1, Fltex b1 -> Fltex (a1 +. b1)
    | _ , _ -> Addex(eval a, eval b)
    in ans
| Subex (a,b) -> let ans = match a,b with
    Intex a1, Intex b1 -> Intex (a1-b1)
    | Intex a1, Fltex b1 -> Fltex (float_of_int a1 -. b1)
    | Fltex a1, Intex b1 -> Fltex (a1 -. float_of_int b1)
    | Fltex a1, Fltex b1 -> Fltex (a1 -. b1)
    | _ , _ -> Subex(eval a, eval b)
    in ans
| Mulex (a,b) -> let ans = match a,b with
    Intex a1, Intex b1 -> Intex (a1*b1)
    | Intex a1, Fltex b1 -> Fltex (float_of_int a1 *. b1)
    | Fltex a1, Intex b1 -> Fltex (a1 *. float_of_int b1)
    | Fltex a1, Fltex b1 -> Fltex (a1 *. b1)
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
| Vectex _ -> failwith "Vector identified"