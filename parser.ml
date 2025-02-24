type token =
  | INT of (
# 1 "parser.mly"
        int
# 6 "parser.ml"
)
  | FLOAT of (
# 2 "parser.mly"
        float
# 11 "parser.ml"
)
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | LPAREN
  | RPAREN
  | LBKT
  | RBKT
  | COMMA
  | EOL

open Parsing
let _ = parse_error;;
let yytransl_const = [|
  259 (* PLUS *);
  260 (* MINUS *);
  261 (* TIMES *);
  262 (* DIV *);
  263 (* LPAREN *);
  264 (* RPAREN *);
  265 (* LBKT *);
  266 (* RBKT *);
  267 (* COMMA *);
  268 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\003\000\003\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\003\000\003\000\003\000\003\000\
\002\000\003\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\000\000\000\000\000\000\013\000\
\000\000\009\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\001\000\004\000\010\000\000\000\000\000\000\000\007\000\
\008\000\000\000"

let yydgoto = "\002\000\
\008\000\009\000\013\000"

let yysindex = "\006\000\
\036\255\000\000\000\000\000\000\036\255\036\255\036\255\000\000\
\030\255\000\000\000\255\043\255\015\255\036\255\036\255\036\255\
\036\255\000\000\000\000\000\000\036\255\045\255\045\255\000\000\
\000\000\043\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\042\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\010\255\020\255\000\000\
\000\000\044\255"

let yygindex = "\000\000\
\000\000\251\255\000\000"

let yytablesize = 55
let yytable = "\010\000\
\011\000\012\000\014\000\015\000\016\000\017\000\001\000\019\000\
\022\000\023\000\024\000\025\000\005\000\005\000\000\000\026\000\
\000\000\005\000\000\000\005\000\005\000\005\000\006\000\006\000\
\020\000\021\000\000\000\006\000\000\000\006\000\006\000\006\000\
\014\000\015\000\016\000\017\000\003\000\004\000\000\000\005\000\
\000\000\018\000\006\000\000\000\007\000\014\000\015\000\016\000\
\017\000\016\000\017\000\011\000\011\000\012\000\012\000"

let yycheck = "\005\000\
\006\000\007\000\003\001\004\001\005\001\006\001\001\000\008\001\
\014\000\015\000\016\000\017\000\003\001\004\001\255\255\021\000\
\255\255\008\001\255\255\010\001\011\001\012\001\003\001\004\001\
\010\001\011\001\255\255\008\001\255\255\010\001\011\001\012\001\
\003\001\004\001\005\001\006\001\001\001\002\001\255\255\004\001\
\255\255\012\001\007\001\255\255\009\001\003\001\004\001\005\001\
\006\001\005\001\006\001\010\001\011\001\010\001\011\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  LPAREN\000\
  RPAREN\000\
  LBKT\000\
  RBKT\000\
  COMMA\000\
  EOL\000\
  "

let yynames_block = "\
  INT\000\
  FLOAT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 13 "parser.mly"
                            ( Ast.eval _1 )
# 120 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 16 "parser.mly"
                            ( Ast.Intex _1 )
# 127 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 17 "parser.mly"
                            ( Ast.Fltex _1 )
# 134 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 18 "parser.mly"
                              ( _2 )
# 141 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 19 "parser.mly"
                              ( Ast.Addex (_1, _3) )
# 149 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 20 "parser.mly"
                              ( Ast.Subex(_1, _3) )
# 157 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 21 "parser.mly"
                              ( Ast.Mulex(_1, _3) )
# 165 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                              ( Ast.Divex(_1, _3) )
# 173 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                              ( Ast.Subex(Ast.Fltex 0., _2) )
# 180 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'elements) in
    Obj.repr(
# 24 "parser.mly"
                              ( Ast.Vectex _2 )
# 187 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 27 "parser.mly"
                            ( [_1] )
# 194 "parser.ml"
               : 'elements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'elements) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 28 "parser.mly"
                            ( _1 @ [_3] )
# 202 "parser.ml"
               : 'elements))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.exp)
