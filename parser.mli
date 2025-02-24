type token =
  | INT of (
# 1 "parser.mly"
        int
# 6 "parser.mli"
)
  | FLOAT of (
# 2 "parser.mly"
        float
# 11 "parser.mli"
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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.exp
