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
| Ast.Varex v -> print_string v
| Ast.Equex (v,w) -> print_string "("; print_exp v; print_string " == "; print_exp w; print_string ")";
| Ast.Addex (v,w) -> print_string "("; print_exp v; print_string " + "; print_exp w; print_string ")";
| Ast.Subex (v,w) -> print_string "("; print_exp v; print_string " - "; print_exp w; print_string ")";
| Ast.Mulex (v,w) -> print_string "("; print_exp v; print_string " * "; print_exp w; print_string ")";
| Ast.Divex (v,w) -> print_string "("; print_exp v; print_string " / "; print_exp w; print_string ")";
| Ast.Dotprodex (v,w) -> print_string "("; print_exp v; print_string " . "; print_exp w; print_string ")";
| Ast.Magex v -> print_string "| ("; print_exp v; print_string ") |";
| Ast.Dimex v -> print_string "dim of "; print_exp v;
| Ast.Anglex (v,w) -> print_string "("; print_exp v; print_string " ^ "; print_exp w; print_string ")";
| Ast.Cndex (v,w,x) -> print_exp v; print_string " => "; print_exp w; print_string " else "; print_exp x;
| Ast.Forex (v,w,x,y) -> print_string "for( "; print_exp v; print_string " "; print_exp w; print_string " "; print_exp x; print_string " "; print_exp y; print_string ")";
| Ast.Lessex (v,w) -> print_string "("; print_exp v; print_string " < "; print_exp w; print_string ")";
| Ast.Morex (v,w) -> print_string "("; print_exp v; print_string " > "; print_exp w; print_string ")";
| Ast.Transex v -> print_string "transpose of "; print_exp v;
| Ast.Invex v -> print_string "inverse of "; print_exp v;
| Ast.Printex v -> print_exp v;
| _ -> failwith "Not a valid result type"
;;

let print_command = function
Ast.Printex v -> print_exp v; Printf.printf "\n";
| Ast.Quitex -> exit 0;
| _ -> ()

(* let main() =
  try
    let lexbuf = Lexing.from_channel stdin in
    while true do
      let result = Parser.main Lexer.token lexbuf in
        print_command result; flush stdout
    done
  with Lexer.Eof ->
    exit 0 *)

    
let main() =
  try
      let lexbu = Lexing.from_channel stdin in
      match Parser.main Lexer.token lexbu with
      | Ast.Inputex s -> let ans = match s with
          | "" -> let lexbuf = Lexing.from_channel stdin in
                  while true do
                    let result = Parser.main Lexer.token lexbuf in
                    print_command result; flush stdout
                  done
          | filename -> let file_channel = open_in filename in
                        let lexbuf = Lexing.from_channel file_channel in
                        (try
                          while true do
                            let result = Parser.main Lexer.token lexbuf in
                            print_command result; flush stdout;
                          done
                        with Lexer.Eof -> close_in file_channel)
          in ans;
      | _ -> failwith "Expected first command to specify mode of input";
  with
    Lexer.Eof -> exit 0


let () = main ()
  (* 
    let rec string_of_exp = function
      | Ast.Intex n -> string_of_int n
      | Ast.Fltex f -> Printf.sprintf "%.2f" f
      | Ast.Boolex true -> "true"
      | Ast.Boolex false -> "false"
      | Ast.Vectex v -> 
          let elements = String.concat ", " (List.map string_of_exp v) in
          "[" ^ elements ^ "]"
      | Ast.Seqex v -> 
          let elements = String.concat " " (List.map string_of_exp v) in
          "sq " ^ elements
      | Ast.Letex (v, e) -> v ^ "=" ^ string_of_exp e
      | Ast.Varex v -> v
      | Ast.Equex (v,w) -> "eq " ^ string_of_exp v ^ " " ^ string_of_exp w
      | Ast.Addex (v,w) -> "ad " ^ string_of_exp v ^ " " ^ string_of_exp w
      | Ast.Subex (v,w) -> "sb " ^ string_of_exp v ^ " " ^ string_of_exp w
      | Ast.Mulex (v,w) -> "ml " ^ string_of_exp v ^ "," ^ string_of_exp w
      | Ast.Divex (v,w) -> "dv " ^ string_of_exp v ^ " " ^ string_of_exp w
      | Ast.Dotprodex (v,w) -> "dp " ^ string_of_exp v ^ " " ^ string_of_exp w
      | Ast.Magex v -> "mg " ^ string_of_exp v
      | Ast.Dimex v -> "dm " ^ string_of_exp v
      | Ast.Anglex (v,w) -> "ag " ^ string_of_exp v ^ " " ^ string_of_exp w
      | Ast.Cndex (v,w,x) -> "cd " ^ string_of_exp v ^ " " ^ string_of_exp w ^ " " ^ string_of_exp x
      | Ast.Forex (v,w,x,y) -> "fr " ^ string_of_exp v ^ " " ^ string_of_exp w ^ " " ^ string_of_exp x ^ " " ^ string_of_exp y
      | Ast.Foldex v -> "fd " ^ string_of_exp v
      | _ -> failwith "Not a valid result type"
    
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
    
    let read_from_stdin () =
      try
        let lexbuf = Lexing.from_channel stdin in
        while true do
          let result = Parser.main Lexer.token lexbuf in
          print_exp result; Printf.printf "\n"; flush stdout
        done
      with Lexer.Eof ->
        exit 0
    
    let read_from_file filename =
      try
        let ic = In_channel.open_text filename in
        let rec read_expressions ic =
          match In_channel.input_line ic with
          | Some line ->
              (* If a line is successfully read, process it *)
              let lexbuf = Lexing.from_string line in
              let result = Parser.main Lexer.token lexbuf in
              print_exp result; Printf.printf "\n"; flush stdout;
              read_expressions ic  (* Recursively read the next line *)
          | None -> 
              (* End of file reached, close the channel *)
              In_channel.close ic
        in
        read_expressions ic
      with Sys_error msg -> 
        Printf.eprintf "Error opening file: %s\n" msg
        
    let write_to_file filename =
      let oc = open_out filename in
      let rec write_expressions oc =
        try
          let lexbuf = Lexing.from_channel stdin in
          let result = Parser.main Lexer.token lexbuf in
          output_string oc (string_of_exp result ^ "\n");
          write_expressions oc
        with Lexer.Eof ->
          close_out oc
      in
      write_expressions oc
    
    let read_and_write_from_file filename1 filename2 =
      try
        (* Open the input and output files *)
        let ic = In_channel.open_text filename1 in
        let oc = Out_channel.open_text filename2 in
    
        let rec read_and_process ic oc =
          match In_channel.input_line ic with
          | Some line ->
              (* Process the line (you can do whatever transformation you need) *)
              let lexbuf = Lexing.from_string line in
              let result = Parser.main Lexer.token lexbuf in
              
              (* Write the result to the output file *)
              Printf.fprintf oc "%s\n" (string_of_exp result);  (* Example write operation *)
              
              (* Continue reading the next line *)
              read_and_process ic oc
          | None ->
              (* End of file reached, close the channels *)
              In_channel.close ic;
              Out_channel.close oc
        in
        (* Start processing *)
        read_and_process ic oc
      with Sys_error msg -> 
        Printf.eprintf "Error opening file: %s\n" msg
    
    let main() =
      try
        let lexbuf = Lexing.from_channel stdin in
        let result = Parser.main Lexer.token lexbuf in
        match result with
        | Ast.Stdin_stdout -> read_from_stdin ()
        | Ast.Stdin_fileout outfile -> write_to_file outfile
        | Ast.Filein_stdout infile -> read_from_file infile
        | Ast.Filein_fileout (infile, outfile) -> read_and_write_from_file infile outfile
        | _ -> print_exp result; Printf.printf "\n"; flush stdout;
      with Lexer.Eof ->
        exit 0
    
    let () = main ()
     *)