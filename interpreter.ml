let rec print_exp = function
Ast.Intex n -> print_int n
| Ast.Fltex f -> print_float f
| Ast.Boolex true -> print_string "true"
| Ast.Boolex false -> print_string "false"
| Ast.Vectex v -> Printf.printf "[";
                              List.iter (fun e -> print_exp e; Printf.printf ", ";) v;
                              Printf.printf "]"
| Ast.Seqex v -> List.iter (fun e -> print_exp e; Printf.printf " ";) v
| Ast.Letex (v, e) -> print_string v; print_string "="; print_exp e;
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