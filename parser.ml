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
  | DOT
  | MOD
  | EOL
  | DIM
  | ANGLE

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
  268 (* DOT *);
  269 (* MOD *);
  270 (* EOL *);
  271 (* DIM *);
  272 (* ANGLE *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* FLOAT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\003\000\003\000\
\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\002\000\003\000\002\000\003\000\001\000\003\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\003\000\000\000\000\000\000\000\000\000\
\000\000\017\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\
\004\000\014\000\000\000\009\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yydgoto = "\002\000\
\010\000\011\000\015\000"

let yysindex = "\005\000\
\019\255\000\000\000\000\000\000\019\255\019\255\019\255\019\255\
\019\255\000\000\032\255\013\255\037\255\056\255\020\255\051\255\
\056\255\019\255\019\255\019\255\019\255\019\255\000\000\019\255\
\000\000\000\000\019\255\000\000\128\255\128\255\013\255\013\255\
\056\255\056\255\056\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\070\255\000\000\040\255\000\000\000\000\
\253\254\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\106\255\118\255\082\255\094\255\
\135\255\142\255\055\255"

let yygindex = "\000\000\
\000\000\251\255\000\000"

let yytablesize = 156
let yytable = "\012\000\
\013\000\014\000\016\000\017\000\013\000\001\000\013\000\013\000\
\000\000\013\000\013\000\000\000\029\000\030\000\031\000\032\000\
\033\000\000\000\034\000\003\000\004\000\035\000\005\000\000\000\
\022\000\006\000\000\000\007\000\024\000\026\000\027\000\008\000\
\000\000\009\000\018\000\019\000\020\000\021\000\000\000\018\000\
\019\000\020\000\021\000\022\000\025\000\023\000\000\000\024\000\
\022\000\015\000\015\000\000\000\024\000\018\000\019\000\020\000\
\021\000\000\000\018\000\019\000\020\000\021\000\022\000\028\000\
\016\000\016\000\024\000\022\000\000\000\000\000\000\000\024\000\
\011\000\011\000\011\000\011\000\000\000\011\000\000\000\011\000\
\011\000\000\000\011\000\011\000\007\000\007\000\007\000\007\000\
\000\000\007\000\000\000\007\000\007\000\000\000\007\000\007\000\
\010\000\010\000\010\000\010\000\000\000\010\000\000\000\010\000\
\010\000\000\000\010\000\010\000\005\000\005\000\000\000\000\000\
\000\000\005\000\000\000\005\000\005\000\000\000\005\000\005\000\
\006\000\006\000\000\000\000\000\000\000\006\000\000\000\006\000\
\006\000\000\000\006\000\006\000\020\000\021\000\000\000\000\000\
\000\000\000\000\000\000\022\000\000\000\000\000\008\000\024\000\
\008\000\008\000\000\000\008\000\008\000\012\000\000\000\012\000\
\012\000\000\000\012\000\012\000"

let yycheck = "\005\000\
\006\000\007\000\008\000\009\000\008\001\001\000\010\001\011\001\
\255\255\013\001\014\001\255\255\018\000\019\000\020\000\021\000\
\022\000\255\255\024\000\001\001\002\001\027\000\004\001\255\255\
\012\001\007\001\255\255\009\001\016\001\010\001\011\001\013\001\
\255\255\015\001\003\001\004\001\005\001\006\001\255\255\003\001\
\004\001\005\001\006\001\012\001\008\001\014\001\255\255\016\001\
\012\001\010\001\011\001\255\255\016\001\003\001\004\001\005\001\
\006\001\255\255\003\001\004\001\005\001\006\001\012\001\013\001\
\010\001\011\001\016\001\012\001\255\255\255\255\255\255\016\001\
\003\001\004\001\005\001\006\001\255\255\008\001\255\255\010\001\
\011\001\255\255\013\001\014\001\003\001\004\001\005\001\006\001\
\255\255\008\001\255\255\010\001\011\001\255\255\013\001\014\001\
\003\001\004\001\005\001\006\001\255\255\008\001\255\255\010\001\
\011\001\255\255\013\001\014\001\003\001\004\001\255\255\255\255\
\255\255\008\001\255\255\010\001\011\001\255\255\013\001\014\001\
\003\001\004\001\255\255\255\255\255\255\008\001\255\255\010\001\
\011\001\255\255\013\001\014\001\005\001\006\001\255\255\255\255\
\255\255\255\255\255\255\012\001\255\255\255\255\008\001\016\001\
\010\001\011\001\255\255\013\001\014\001\008\001\255\255\010\001\
\011\001\255\255\013\001\014\001"

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
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 13 "parser.mly"
                            ( Ast.eval _1 )
# 163 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 16 "parser.mly"
                            ( Ast.Intex _1 )
# 170 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 17 "parser.mly"
                            ( Ast.Fltex _1 )
# 177 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 18 "parser.mly"
                              ( _2 )
# 184 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 19 "parser.mly"
                              ( Ast.Addex (_1, _3) )
# 192 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 20 "parser.mly"
                              ( Ast.Subex(_1, _3) )
# 200 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 21 "parser.mly"
                              ( Ast.Mulex(_1, _3) )
# 208 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                              ( Ast.Dotprodex (_1, _3) )
# 216 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 23 "parser.mly"
                              ( Ast.Magex _2 )
# 223 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 24 "parser.mly"
                              ( Ast.Divex(_1, _3) )
# 231 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 25 "parser.mly"
                              ( Ast.Subex(Ast.Fltex 0., _2) )
# 238 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 26 "parser.mly"
                              ( Ast.Anglex(_1,_3) )
# 246 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 27 "parser.mly"
                              ( Ast.Dimex _2 )
# 253 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'elements) in
    Obj.repr(
# 28 "parser.mly"
                              ( Ast.Vectex _2 )
# 260 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                            ( [Ast.eval _1] )
# 267 "parser.ml"
               : 'elements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'elements) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 32 "parser.mly"
                            ( _1 @ [Ast.eval _3] )
# 275 "parser.ml"
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
