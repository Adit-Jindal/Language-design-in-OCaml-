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
  | BOOL of (
# 3 "parser.mly"
        bool
# 16 "parser.ml"
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
  | DOT
  | MOD
  | EOL
  | DIM
  | ANGLE

open Parsing
let _ = parse_error;;
let yytransl_const = [|
  260 (* PLUS *);
  261 (* MINUS *);
  262 (* TIMES *);
  263 (* DIV *);
  264 (* LPAREN *);
  265 (* RPAREN *);
  266 (* LBKT *);
  267 (* RBKT *);
  268 (* COMMA *);
  269 (* DOT *);
  270 (* MOD *);
  271 (* EOL *);
  272 (* DIM *);
  273 (* ANGLE *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* FLOAT *);
  259 (* BOOL *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\003\000\
\003\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\002\000\003\000\002\000\003\000\001\000\
\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\004\000\000\000\000\000\000\000\
\000\000\000\000\018\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\
\000\000\005\000\015\000\000\000\010\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\011\000\012\000\016\000"

let yysindex = "\005\000\
\022\255\000\000\000\000\000\000\000\000\022\255\022\255\022\255\
\022\255\022\255\000\000\035\255\016\255\040\255\059\255\009\255\
\054\255\059\255\022\255\022\255\022\255\022\255\022\255\000\000\
\022\255\000\000\000\000\022\255\000\000\131\255\131\255\016\255\
\016\255\059\255\059\255\059\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\073\255\000\000\023\255\000\000\
\000\000\252\254\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\109\255\121\255\085\255\
\097\255\138\255\145\255\043\255"

let yygindex = "\000\000\
\000\000\250\255\000\000"

let yytablesize = 160
let yytable = "\013\000\
\014\000\015\000\017\000\018\000\014\000\001\000\014\000\014\000\
\000\000\014\000\014\000\000\000\030\000\031\000\032\000\033\000\
\034\000\000\000\035\000\027\000\028\000\036\000\003\000\004\000\
\005\000\000\000\006\000\000\000\023\000\007\000\000\000\008\000\
\025\000\016\000\016\000\009\000\000\000\010\000\019\000\020\000\
\021\000\022\000\000\000\019\000\020\000\021\000\022\000\023\000\
\026\000\024\000\000\000\025\000\023\000\017\000\017\000\000\000\
\025\000\019\000\020\000\021\000\022\000\000\000\019\000\020\000\
\021\000\022\000\023\000\029\000\000\000\000\000\025\000\023\000\
\000\000\000\000\000\000\025\000\012\000\012\000\012\000\012\000\
\000\000\012\000\000\000\012\000\012\000\000\000\012\000\012\000\
\008\000\008\000\008\000\008\000\000\000\008\000\000\000\008\000\
\008\000\000\000\008\000\008\000\011\000\011\000\011\000\011\000\
\000\000\011\000\000\000\011\000\011\000\000\000\011\000\011\000\
\006\000\006\000\000\000\000\000\000\000\006\000\000\000\006\000\
\006\000\000\000\006\000\006\000\007\000\007\000\000\000\000\000\
\000\000\007\000\000\000\007\000\007\000\000\000\007\000\007\000\
\021\000\022\000\000\000\000\000\000\000\000\000\000\000\023\000\
\000\000\000\000\009\000\025\000\009\000\009\000\000\000\009\000\
\009\000\013\000\000\000\013\000\013\000\000\000\013\000\013\000"

let yycheck = "\006\000\
\007\000\008\000\009\000\010\000\009\001\001\000\011\001\012\001\
\255\255\014\001\015\001\255\255\019\000\020\000\021\000\022\000\
\023\000\255\255\025\000\011\001\012\001\028\000\001\001\002\001\
\003\001\255\255\005\001\255\255\013\001\008\001\255\255\010\001\
\017\001\011\001\012\001\014\001\255\255\016\001\004\001\005\001\
\006\001\007\001\255\255\004\001\005\001\006\001\007\001\013\001\
\009\001\015\001\255\255\017\001\013\001\011\001\012\001\255\255\
\017\001\004\001\005\001\006\001\007\001\255\255\004\001\005\001\
\006\001\007\001\013\001\014\001\255\255\255\255\017\001\013\001\
\255\255\255\255\255\255\017\001\004\001\005\001\006\001\007\001\
\255\255\009\001\255\255\011\001\012\001\255\255\014\001\015\001\
\004\001\005\001\006\001\007\001\255\255\009\001\255\255\011\001\
\012\001\255\255\014\001\015\001\004\001\005\001\006\001\007\001\
\255\255\009\001\255\255\011\001\012\001\255\255\014\001\015\001\
\004\001\005\001\255\255\255\255\255\255\009\001\255\255\011\001\
\012\001\255\255\014\001\015\001\004\001\005\001\255\255\255\255\
\255\255\009\001\255\255\011\001\012\001\255\255\014\001\015\001\
\006\001\007\001\255\255\255\255\255\255\255\255\255\255\013\001\
\255\255\255\255\009\001\017\001\011\001\012\001\255\255\014\001\
\015\001\009\001\255\255\011\001\012\001\255\255\014\001\015\001"

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
  DOT\000\
  MOD\000\
  EOL\000\
  DIM\000\
  ANGLE\000\
  "

let yynames_block = "\
  INT\000\
  FLOAT\000\
  BOOL\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 14 "parser.mly"
                            ( Ast.eval _1 )
# 170 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 17 "parser.mly"
                            ( Ast.Intex _1 )
# 177 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 18 "parser.mly"
                            ( Ast.Fltex _1 )
# 184 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 19 "parser.mly"
                            ( Ast.Boolex _1 )
# 191 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 20 "parser.mly"
                              ( _2 )
# 198 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 21 "parser.mly"
                              ( Ast.Addex (_1, _3) )
# 206 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                              ( Ast.Subex(_1, _3) )
# 214 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                              ( Ast.Mulex(_1, _3) )
# 222 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                              ( Ast.Dotprodex (_1, _3) )
# 230 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                              ( Ast.Magex _2 )
# 237 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 26 "parser.mly"
                              ( Ast.Divex(_1, _3) )
# 245 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 27 "parser.mly"
                              ( Ast.Subex(Ast.Fltex 0., _2) )
# 252 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 28 "parser.mly"
                              ( Ast.Anglex(_1,_3) )
# 260 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 29 "parser.mly"
                              ( Ast.Dimex _2 )
# 267 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'elements) in
    Obj.repr(
# 30 "parser.mly"
                              ( Ast.Vectex _2 )
# 274 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 33 "parser.mly"
                            ( [Ast.eval _1] )
# 281 "parser.ml"
               : 'elements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'elements) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "parser.mly"
                            ( _1 @ [Ast.eval _3] )
# 289 "parser.ml"
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
