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
  | BOOL of (
# 3 "parser.mly"
        bool
# 16 "parser.mli"
)
  | VAR of (
# 4 "parser.mly"
        string
# 21 "parser.mli"
)
  | PLUS
  | MINUS
  | TIMES
  | DIV
  | LPAREN
  | RPAREN
  | LBRACES
  | RBRACES
  | LBKT
  | RBKT
  | COMMA
  | DOT
  | MOD
  | SEMICOLON
  | EQUALITY
  | EOL
  | DIM
  | ANGLE
  | IF
  | THEN
  | ELSE
  | ASSIGN
  | FOR

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.exp
