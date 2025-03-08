# 1 "lexer.mll"
 
    open Parser        (*The type token is defined in parser.mli*)
    exception Eof

# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\222\255\223\255\224\255\000\000\002\000\000\000\001\000\
    \003\000\233\255\234\255\235\255\236\255\237\255\238\255\239\255\
    \240\255\241\255\001\000\243\255\045\000\245\255\246\255\247\255\
    \248\255\000\000\003\000\061\000\106\000\254\255\255\255\116\000\
    \126\000\008\000\000\000\230\255\000\000\227\255\048\000\226\255\
    \003\000\242\255\232\255\231\255\000\000\012\000\229\255\228\255\
    \012\000\010\000\019\000\225\255\049\000\254\255\050\000\051\000\
    \255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\011\000\255\255\255\255\255\255\
    \255\255\006\000\005\000\004\000\002\000\255\255\255\255\255\255\
    \003\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\001\000\255\255\
    \255\255";
  Lexing.lex_default =
   "\255\255\000\000\000\000\000\000\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\000\000\255\255\000\000\000\000\000\000\
    \000\000\255\255\255\255\255\255\255\255\000\000\000\000\255\255\
    \255\255\255\255\255\255\000\000\255\255\000\000\255\255\000\000\
    \255\255\000\000\000\000\000\000\255\255\255\255\000\000\000\000\
    \255\255\255\255\255\255\000\000\053\000\000\000\255\255\255\255\
    \000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\030\000\029\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \016\000\015\000\022\000\024\000\010\000\023\000\021\000\020\000\
    \028\000\028\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\005\000\009\000\003\000\008\000\002\000\047\000\
    \042\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\014\000\038\000\013\000\017\000\039\000\
    \054\000\055\000\056\000\000\000\018\000\006\000\025\000\043\000\
    \048\000\007\000\040\000\033\000\044\000\034\000\035\000\036\000\
    \041\000\046\000\037\000\045\000\026\000\049\000\050\000\004\000\
    \051\000\000\000\000\000\012\000\019\000\011\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \031\000\000\000\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \008\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\020\000\000\000\000\000\038\000\
    \052\000\054\000\055\000\255\255\000\000\000\000\000\000\007\000\
    \004\000\000\000\018\000\026\000\006\000\033\000\034\000\025\000\
    \040\000\045\000\036\000\044\000\000\000\048\000\049\000\000\000\
    \050\000\255\255\255\255\000\000\000\000\000\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \027\000\027\000\027\000\027\000\027\000\027\000\027\000\027\000\
    \028\000\255\255\028\000\028\000\028\000\028\000\028\000\028\000\
    \028\000\028\000\028\000\028\000\031\000\031\000\031\000\031\000\
    \031\000\031\000\031\000\031\000\031\000\031\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\052\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 7 "lexer.mll"
                                        ( token lexbuf )
# 155 "lexer.ml"

  | 1 ->
# 8 "lexer.mll"
                                        ( EOL )
# 160 "lexer.ml"

  | 2 ->
let
# 9 "lexer.mll"
                    lxm
# 166 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 9 "lexer.mll"
                                        ( INT(int_of_string lxm) )
# 170 "lexer.ml"

  | 3 ->
let
# 10 "lexer.mll"
                                   lxm
# 176 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 10 "lexer.mll"
                                        ( FLOAT(float_of_string lxm) )
# 180 "lexer.ml"

  | 4 ->
let
# 11 "lexer.mll"
                    lxm
# 186 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 11 "lexer.mll"
                                        ( VAR(lxm) )
# 190 "lexer.ml"

  | 5 ->
# 12 "lexer.mll"
                                        ( BOOL (true) )
# 195 "lexer.ml"

  | 6 ->
# 13 "lexer.mll"
                                        ( BOOL (false) )
# 200 "lexer.ml"

  | 7 ->
# 14 "lexer.mll"
                                        ( PLUS )
# 205 "lexer.ml"

  | 8 ->
# 15 "lexer.mll"
                                        ( MINUS )
# 210 "lexer.ml"

  | 9 ->
# 16 "lexer.mll"
                                        ( TIMES )
# 215 "lexer.ml"

  | 10 ->
# 17 "lexer.mll"
                                        ( DOT )
# 220 "lexer.ml"

  | 11 ->
# 18 "lexer.mll"
                                        ( DIV )
# 225 "lexer.ml"

  | 12 ->
# 19 "lexer.mll"
                                        ( MOD )
# 230 "lexer.ml"

  | 13 ->
# 20 "lexer.mll"
                                        ( DIM )
# 235 "lexer.ml"

  | 14 ->
# 21 "lexer.mll"
                                        ( ANGLE )
# 240 "lexer.ml"

  | 15 ->
# 22 "lexer.mll"
                                        ( LPAREN )
# 245 "lexer.ml"

  | 16 ->
# 23 "lexer.mll"
                                        ( RPAREN )
# 250 "lexer.ml"

  | 17 ->
# 24 "lexer.mll"
                                        ( LBKT )
# 255 "lexer.ml"

  | 18 ->
# 25 "lexer.mll"
                                        ( RBKT )
# 260 "lexer.ml"

  | 19 ->
# 26 "lexer.mll"
                                        ( LBRACES )
# 265 "lexer.ml"

  | 20 ->
# 27 "lexer.mll"
                                        ( RBRACES )
# 270 "lexer.ml"

  | 21 ->
# 28 "lexer.mll"
                                        ( COMMA )
# 275 "lexer.ml"

  | 22 ->
# 29 "lexer.mll"
                                        ( SEMICOLON )
# 280 "lexer.ml"

  | 23 ->
# 30 "lexer.mll"
                                        ( EQUALITY )
# 285 "lexer.ml"

  | 24 ->
# 31 "lexer.mll"
                                        ( IF )
# 290 "lexer.ml"

  | 25 ->
# 32 "lexer.mll"
                                        ( THEN )
# 295 "lexer.ml"

  | 26 ->
# 33 "lexer.mll"
                                        ( ELSE )
# 300 "lexer.ml"

  | 27 ->
# 34 "lexer.mll"
                                        ( ASSIGN )
# 305 "lexer.ml"

  | 28 ->
# 35 "lexer.mll"
                                        ( FOR )
# 310 "lexer.ml"

  | 29 ->
# 36 "lexer.mll"
                                        ( comment lexbuf )
# 315 "lexer.ml"

  | 30 ->
# 37 "lexer.mll"
                                        ( WHILE )
# 320 "lexer.ml"

  | 31 ->
# 38 "lexer.mll"
                                        ( LESS )
# 325 "lexer.ml"

  | 32 ->
# 39 "lexer.mll"
                                        ( MORE )
# 330 "lexer.ml"

  | 33 ->
# 40 "lexer.mll"
                                        ( raise Eof )
# 335 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and comment lexbuf =
   __ocaml_lex_comment_rec lexbuf 52
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 43 "lexer.mll"
                                      ( token lexbuf )
# 347 "lexer.ml"

  | 1 ->
# 44 "lexer.mll"
                                        ( comment lexbuf )
# 352 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

;;

