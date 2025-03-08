let rec print_exp = function
Ast.Intex n -> print_int n
| Ast.Fltex f -> print_float f
| Ast.Boolex true -> print_string "true"
| Ast.Boolex false -> print_string "false"
| Ast.Vectex v -> print_string "vc"; Printf.printf "[";
                              List.iter (fun e -> print_exp e; Printf.printf ", ";) v;
                              Printf.printf "]"
| Ast.Seqex v -> print_string " sq "; List.iter (fun e -> print_exp e; Printf.printf " ";) v
| Ast.Letex (v, e) -> print_string v; print_string "="; print_exp e;
| Ast.Varex v -> print_string v
| Ast.Equex (v,w) -> print_string "eq"; print_exp v; print_string " "; print_exp w;
| Ast.Addex (v,w) -> print_string "ad"; print_exp v; print_string " "; print_exp w;
| Ast.Subex (v,w) -> print_string "sb"; print_exp v; print_string " "; print_exp w;
| Ast.Mulex (v,w) -> print_string "ml"; print_exp v; print_string ","; print_exp w;
| Ast.Divex (v,w) -> print_string "dv"; print_exp v; print_string " "; print_exp w;
| Ast.Dotprodex (v,w) -> print_string "dp"; print_exp v; print_string " "; print_exp w;
| Ast.Magex v -> print_string "mg"; print_exp v
| Ast.Dimex v -> print_string "dm"; print_exp v
| Ast.Anglex (v,w) -> print_string "ag"; print_exp v; print_string " "; print_exp w;
| Ast.Cndex (v,w,x) -> print_string "cd"; print_exp v; print_string " "; print_exp w; print_string " "; print_exp x;
| Ast.Forex (v,w,x,y) -> print_string "fr"; print_exp v; print_string " "; print_exp w; print_string " "; print_exp x; print_string " "; print_exp y;
| Ast.Foldex v -> print_string "fd"; print_exp v
| _ -> failwith "Not a valid result type"

let main() =
  try
    let lexbuf = Lexing.from_channel stdin in
    while true do
      let result = Parser.main Lexer.token lexbuf in
        print_exp result; Printf.printf "\n"; flush stdout
    done
  with Lexer.Eof ->
    exit 0

let () = main ()