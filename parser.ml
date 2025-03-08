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
  | VAR of (
# 4 "parser.mly"
        string
# 21 "parser.ml"
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
  | LESS
  | MORE
  | EOL
  | DIM
  | ANGLE
  | IF
  | THEN
  | ELSE
  | ASSIGN
  | FOR
  | WHILE

open Parsing
let _ = parse_error;;
let yytransl_const = [|
  261 (* PLUS *);
  262 (* MINUS *);
  263 (* TIMES *);
  264 (* DIV *);
  265 (* LPAREN *);
  266 (* RPAREN *);
  267 (* LBRACES *);
  268 (* RBRACES *);
  269 (* LBKT *);
  270 (* RBKT *);
  271 (* COMMA *);
  272 (* DOT *);
  273 (* MOD *);
  274 (* SEMICOLON *);
  275 (* EQUALITY *);
  276 (* LESS *);
  277 (* MORE *);
  278 (* EOL *);
  279 (* DIM *);
  280 (* ANGLE *);
  281 (* IF *);
  282 (* THEN *);
  283 (* ELSE *);
  284 (* ASSIGN *);
  285 (* FOR *);
  286 (* WHILE *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* FLOAT *);
  259 (* BOOL *);
  260 (* VAR *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\003\000\003\000\004\000\004\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\005\000\005\000\005\000\006\000\006\000\007\000\007\000\000\000"

let yylen = "\002\000\
\002\000\003\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\002\000\
\003\000\002\000\003\000\003\000\006\000\003\000\009\000\005\000\
\001\000\003\000\001\000\003\000\003\000\001\000\001\000\001\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\002\000\003\000\002\000\003\000\003\000\006\000\
\003\000\009\000\005\000\001\000\003\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\004\000\005\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\056\000\
\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\
\002\000\020\000\000\000\019\000\000\000\015\000\000\000\000\000\
\030\000\031\000\032\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\010\000\011\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\043\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\029\000\047\000\000\000\046\000\
\000\000\042\000\000\000\000\000\000\000\000\000\000\000\037\000\
\038\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yydgoto = "\002\000\
\016\000\017\000\024\000\022\000\062\000\082\000\080\000"

let yysindex = "\021\000\
\095\255\000\000\000\000\000\000\000\000\017\255\095\255\095\255\
\095\255\095\255\095\255\095\255\095\255\049\255\084\255\000\000\
\100\000\095\255\000\000\107\000\025\001\019\255\025\001\005\255\
\127\000\025\001\056\000\095\255\125\255\095\255\095\255\095\255\
\095\255\095\255\095\255\095\255\095\255\000\000\095\255\025\001\
\000\000\000\000\095\255\000\000\095\255\000\000\095\255\134\000\
\000\000\000\000\000\000\048\255\125\255\125\255\125\255\125\255\
\125\255\125\255\125\255\091\255\098\255\154\000\053\255\053\255\
\000\000\000\000\002\255\063\000\063\000\063\000\002\255\025\001\
\025\001\062\255\125\255\125\255\000\000\161\000\045\001\021\255\
\045\001\058\255\181\000\045\001\078\000\095\255\125\255\125\255\
\125\255\125\255\125\255\125\255\125\255\125\255\125\255\125\255\
\125\255\095\255\188\000\045\001\000\000\000\000\125\255\000\000\
\125\255\000\000\125\255\208\000\228\000\067\255\067\255\000\000\
\000\000\045\001\036\255\085\000\085\000\085\000\036\255\025\001\
\125\255\045\001\045\001\033\000\125\255\125\255\235\000\125\255\
\255\000\045\001\125\255\045\001\125\255\045\001\019\001\125\255\
\045\001"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\151\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\045\255\000\000\088\255\000\000\
\000\000\238\001\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\174\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\197\255\220\255\
\000\000\000\000\058\001\130\001\148\001\166\001\076\001\047\255\
\096\255\000\000\000\000\000\000\000\000\000\000\059\255\000\000\
\099\255\000\000\000\000\018\002\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\036\002\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\243\255\010\000\000\000\
\000\000\054\002\094\001\184\001\202\001\220\001\112\001\072\002\
\000\000\076\255\101\255\000\000\000\000\000\000\000\000\000\000\
\000\000\090\002\000\000\108\002\000\000\126\002\000\000\000\000\
\144\002"

let yygindex = "\000\000\
\000\000\249\255\000\000\000\000\215\255\000\000\000\000"

let yytablesize = 939
let yytable = "\019\000\
\020\000\021\000\023\000\025\000\026\000\027\000\030\000\031\000\
\032\000\033\000\040\000\077\000\078\000\079\000\081\000\083\000\
\084\000\085\000\044\000\045\000\048\000\001\000\063\000\064\000\
\065\000\066\000\067\000\068\000\069\000\070\000\042\000\071\000\
\102\000\099\000\100\000\072\000\043\000\073\000\103\000\074\000\
\088\000\089\000\090\000\091\000\018\000\109\000\110\000\111\000\
\112\000\113\000\114\000\115\000\116\000\117\000\118\000\119\000\
\027\000\028\000\028\000\032\000\033\000\122\000\027\000\123\000\
\028\000\124\000\030\000\031\000\032\000\033\000\054\000\104\000\
\105\000\090\000\091\000\076\000\054\000\034\000\108\000\127\000\
\035\000\036\000\037\000\129\000\130\000\039\000\132\000\055\000\
\098\000\134\000\120\000\135\000\029\000\055\000\137\000\003\000\
\004\000\005\000\006\000\086\000\007\000\025\000\025\000\008\000\
\000\000\009\000\087\000\010\000\000\000\026\000\026\000\011\000\
\052\000\052\000\053\000\053\000\000\000\012\000\000\000\013\000\
\000\000\000\000\000\000\014\000\015\000\049\000\050\000\051\000\
\052\000\000\000\053\000\000\000\000\000\054\000\000\000\055\000\
\000\000\056\000\000\000\000\000\000\000\057\000\000\000\000\000\
\000\000\000\000\000\000\058\000\000\000\059\000\000\000\000\000\
\000\000\060\000\061\000\006\000\006\000\006\000\006\000\000\000\
\006\000\000\000\006\000\000\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\006\000\006\000\000\000\006\000\000\000\
\006\000\006\000\033\000\033\000\033\000\033\000\000\000\033\000\
\000\000\033\000\000\000\033\000\033\000\033\000\033\000\033\000\
\033\000\033\000\033\000\033\000\000\000\033\000\000\000\033\000\
\033\000\008\000\008\000\000\000\000\000\000\000\008\000\000\000\
\008\000\000\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\008\000\000\000\008\000\000\000\008\000\008\000\
\009\000\009\000\000\000\000\000\000\000\009\000\000\000\009\000\
\000\000\009\000\009\000\009\000\009\000\009\000\009\000\009\000\
\009\000\009\000\000\000\009\000\000\000\009\000\009\000\035\000\
\035\000\000\000\000\000\000\000\035\000\000\000\035\000\000\000\
\035\000\035\000\035\000\035\000\035\000\035\000\035\000\035\000\
\035\000\000\000\035\000\000\000\035\000\035\000\036\000\036\000\
\000\000\000\000\000\000\036\000\000\000\036\000\000\000\036\000\
\036\000\036\000\036\000\036\000\036\000\036\000\036\000\036\000\
\000\000\036\000\000\000\036\000\036\000\088\000\089\000\090\000\
\091\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\093\000\000\000\000\000\094\000\095\000\096\000\000\000\000\000\
\097\000\000\000\000\000\128\000\030\000\031\000\032\000\033\000\
\000\000\000\000\000\000\030\000\031\000\032\000\033\000\034\000\
\000\000\000\000\035\000\036\000\037\000\000\000\034\000\039\000\
\000\000\047\000\088\000\089\000\090\000\091\000\039\000\000\000\
\000\000\088\000\089\000\090\000\091\000\093\000\000\000\000\000\
\094\000\095\000\096\000\000\000\093\000\097\000\000\000\107\000\
\030\000\031\000\032\000\033\000\097\000\000\000\000\000\030\000\
\031\000\032\000\033\000\034\000\041\000\000\000\035\000\036\000\
\037\000\038\000\034\000\039\000\000\000\035\000\036\000\037\000\
\000\000\000\000\039\000\030\000\031\000\032\000\033\000\000\000\
\000\000\000\000\030\000\031\000\032\000\033\000\034\000\046\000\
\000\000\035\000\036\000\037\000\075\000\034\000\039\000\000\000\
\035\000\036\000\037\000\000\000\000\000\039\000\088\000\089\000\
\090\000\091\000\000\000\092\000\000\000\088\000\089\000\090\000\
\091\000\093\000\101\000\000\000\094\000\095\000\096\000\000\000\
\093\000\097\000\000\000\094\000\095\000\096\000\000\000\000\000\
\097\000\088\000\089\000\090\000\091\000\000\000\000\000\000\000\
\088\000\089\000\090\000\091\000\093\000\106\000\000\000\094\000\
\095\000\096\000\121\000\093\000\097\000\000\000\094\000\095\000\
\096\000\000\000\000\000\097\000\030\000\031\000\032\000\033\000\
\000\000\000\000\000\000\000\000\000\000\000\000\125\000\034\000\
\000\000\000\000\035\000\036\000\037\000\000\000\000\000\039\000\
\088\000\089\000\090\000\091\000\000\000\126\000\000\000\088\000\
\089\000\090\000\091\000\093\000\131\000\000\000\094\000\095\000\
\096\000\000\000\093\000\097\000\000\000\094\000\095\000\096\000\
\000\000\000\000\097\000\088\000\089\000\090\000\091\000\000\000\
\000\000\000\000\000\000\000\000\000\000\133\000\093\000\000\000\
\000\000\094\000\095\000\096\000\000\000\000\000\097\000\088\000\
\089\000\090\000\091\000\000\000\136\000\030\000\031\000\032\000\
\033\000\000\000\093\000\000\000\000\000\094\000\095\000\096\000\
\034\000\000\000\097\000\035\000\036\000\037\000\000\000\000\000\
\039\000\088\000\089\000\090\000\091\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\093\000\000\000\000\000\094\000\
\095\000\096\000\000\000\007\000\097\000\007\000\000\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\000\000\007\000\000\000\007\000\007\000\017\000\000\000\017\000\
\000\000\017\000\017\000\017\000\017\000\017\000\017\000\017\000\
\017\000\017\000\000\000\017\000\000\000\017\000\017\000\034\000\
\000\000\034\000\000\000\034\000\034\000\034\000\034\000\034\000\
\034\000\034\000\034\000\034\000\000\000\034\000\000\000\034\000\
\034\000\044\000\000\000\044\000\000\000\044\000\044\000\044\000\
\044\000\044\000\044\000\044\000\044\000\044\000\000\000\044\000\
\000\000\044\000\044\000\012\000\000\000\012\000\000\000\012\000\
\012\000\000\000\012\000\012\000\012\000\012\000\012\000\012\000\
\000\000\000\000\000\000\012\000\012\000\013\000\000\000\013\000\
\000\000\013\000\013\000\000\000\013\000\013\000\013\000\013\000\
\013\000\013\000\000\000\000\000\000\000\013\000\013\000\014\000\
\000\000\014\000\000\000\014\000\014\000\000\000\014\000\014\000\
\014\000\014\000\014\000\014\000\000\000\000\000\000\000\014\000\
\014\000\039\000\000\000\039\000\000\000\039\000\039\000\000\000\
\039\000\039\000\039\000\039\000\039\000\039\000\000\000\000\000\
\000\000\039\000\039\000\040\000\000\000\040\000\000\000\040\000\
\040\000\000\000\040\000\040\000\040\000\040\000\040\000\040\000\
\000\000\000\000\000\000\040\000\040\000\041\000\000\000\041\000\
\000\000\041\000\041\000\000\000\041\000\041\000\041\000\041\000\
\041\000\041\000\000\000\000\000\000\000\041\000\041\000\018\000\
\000\000\018\000\000\000\018\000\018\000\000\000\018\000\018\000\
\000\000\000\000\000\000\018\000\000\000\000\000\000\000\018\000\
\018\000\022\000\000\000\022\000\000\000\022\000\022\000\000\000\
\022\000\022\000\000\000\000\000\000\000\022\000\000\000\000\000\
\000\000\022\000\022\000\045\000\000\000\045\000\000\000\045\000\
\045\000\000\000\045\000\045\000\000\000\000\000\000\000\045\000\
\000\000\000\000\000\000\045\000\045\000\049\000\000\000\049\000\
\000\000\049\000\049\000\000\000\049\000\049\000\000\000\000\000\
\000\000\049\000\000\000\000\000\000\000\049\000\049\000\024\000\
\000\000\024\000\000\000\024\000\024\000\000\000\024\000\024\000\
\000\000\000\000\000\000\024\000\000\000\000\000\000\000\024\000\
\024\000\021\000\000\000\021\000\000\000\021\000\021\000\000\000\
\021\000\021\000\000\000\000\000\000\000\021\000\000\000\000\000\
\000\000\021\000\021\000\051\000\000\000\051\000\000\000\051\000\
\051\000\000\000\051\000\051\000\000\000\000\000\000\000\051\000\
\000\000\000\000\000\000\051\000\051\000\048\000\000\000\048\000\
\000\000\048\000\048\000\000\000\048\000\048\000\000\000\000\000\
\000\000\048\000\000\000\000\000\000\000\048\000\048\000\023\000\
\000\000\023\000\000\000\023\000\023\000\000\000\023\000\023\000\
\000\000\000\000\000\000\023\000\000\000\000\000\000\000\023\000\
\023\000\050\000\000\000\050\000\000\000\050\000\050\000\000\000\
\050\000\050\000\000\000\000\000\000\000\050\000\000\000\000\000\
\000\000\050\000\050\000"

let yycheck = "\007\000\
\008\000\009\000\010\000\011\000\012\000\013\000\005\001\006\001\
\007\001\008\001\018\000\053\000\054\000\055\000\056\000\057\000\
\058\000\059\000\014\001\015\001\028\000\001\000\030\000\031\000\
\032\000\033\000\034\000\035\000\036\000\037\000\012\001\039\000\
\012\001\075\000\076\000\043\000\018\001\045\000\018\001\047\000\
\005\001\006\001\007\001\008\001\028\001\087\000\088\000\089\000\
\090\000\091\000\092\000\093\000\094\000\095\000\096\000\097\000\
\012\001\009\001\012\001\007\001\008\001\103\000\018\001\105\000\
\018\001\107\000\005\001\006\001\007\001\008\001\012\001\014\001\
\015\001\007\001\008\001\028\001\018\001\016\001\086\000\121\000\
\019\001\020\001\021\001\125\000\126\000\024\001\128\000\012\001\
\027\001\131\000\098\000\133\000\009\001\018\001\136\000\001\001\
\002\001\003\001\004\001\009\001\006\001\014\001\015\001\009\001\
\255\255\011\001\009\001\013\001\255\255\014\001\015\001\017\001\
\014\001\015\001\014\001\015\001\255\255\023\001\255\255\025\001\
\255\255\255\255\255\255\029\001\030\001\001\001\002\001\003\001\
\004\001\255\255\006\001\255\255\255\255\009\001\255\255\011\001\
\255\255\013\001\255\255\255\255\255\255\017\001\255\255\255\255\
\255\255\255\255\255\255\023\001\255\255\025\001\255\255\255\255\
\255\255\029\001\030\001\005\001\006\001\007\001\008\001\255\255\
\010\001\255\255\012\001\255\255\014\001\015\001\016\001\017\001\
\018\001\019\001\020\001\021\001\022\001\255\255\024\001\255\255\
\026\001\027\001\005\001\006\001\007\001\008\001\255\255\010\001\
\255\255\012\001\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\255\255\024\001\255\255\026\001\
\027\001\005\001\006\001\255\255\255\255\255\255\010\001\255\255\
\012\001\255\255\014\001\015\001\016\001\017\001\018\001\019\001\
\020\001\021\001\022\001\255\255\024\001\255\255\026\001\027\001\
\005\001\006\001\255\255\255\255\255\255\010\001\255\255\012\001\
\255\255\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\024\001\255\255\026\001\027\001\005\001\
\006\001\255\255\255\255\255\255\010\001\255\255\012\001\255\255\
\014\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\
\022\001\255\255\024\001\255\255\026\001\027\001\005\001\006\001\
\255\255\255\255\255\255\010\001\255\255\012\001\255\255\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\255\255\024\001\255\255\026\001\027\001\005\001\006\001\007\001\
\008\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\016\001\255\255\255\255\019\001\020\001\021\001\255\255\255\255\
\024\001\255\255\255\255\027\001\005\001\006\001\007\001\008\001\
\255\255\255\255\255\255\005\001\006\001\007\001\008\001\016\001\
\255\255\255\255\019\001\020\001\021\001\255\255\016\001\024\001\
\255\255\026\001\005\001\006\001\007\001\008\001\024\001\255\255\
\255\255\005\001\006\001\007\001\008\001\016\001\255\255\255\255\
\019\001\020\001\021\001\255\255\016\001\024\001\255\255\026\001\
\005\001\006\001\007\001\008\001\024\001\255\255\255\255\005\001\
\006\001\007\001\008\001\016\001\010\001\255\255\019\001\020\001\
\021\001\022\001\016\001\024\001\255\255\019\001\020\001\021\001\
\255\255\255\255\024\001\005\001\006\001\007\001\008\001\255\255\
\255\255\255\255\005\001\006\001\007\001\008\001\016\001\017\001\
\255\255\019\001\020\001\021\001\015\001\016\001\024\001\255\255\
\019\001\020\001\021\001\255\255\255\255\024\001\005\001\006\001\
\007\001\008\001\255\255\010\001\255\255\005\001\006\001\007\001\
\008\001\016\001\010\001\255\255\019\001\020\001\021\001\255\255\
\016\001\024\001\255\255\019\001\020\001\021\001\255\255\255\255\
\024\001\005\001\006\001\007\001\008\001\255\255\255\255\255\255\
\005\001\006\001\007\001\008\001\016\001\017\001\255\255\019\001\
\020\001\021\001\015\001\016\001\024\001\255\255\019\001\020\001\
\021\001\255\255\255\255\024\001\005\001\006\001\007\001\008\001\
\255\255\255\255\255\255\255\255\255\255\255\255\015\001\016\001\
\255\255\255\255\019\001\020\001\021\001\255\255\255\255\024\001\
\005\001\006\001\007\001\008\001\255\255\010\001\255\255\005\001\
\006\001\007\001\008\001\016\001\010\001\255\255\019\001\020\001\
\021\001\255\255\016\001\024\001\255\255\019\001\020\001\021\001\
\255\255\255\255\024\001\005\001\006\001\007\001\008\001\255\255\
\255\255\255\255\255\255\255\255\255\255\015\001\016\001\255\255\
\255\255\019\001\020\001\021\001\255\255\255\255\024\001\005\001\
\006\001\007\001\008\001\255\255\010\001\005\001\006\001\007\001\
\008\001\255\255\016\001\255\255\255\255\019\001\020\001\021\001\
\016\001\255\255\024\001\019\001\020\001\021\001\255\255\255\255\
\024\001\005\001\006\001\007\001\008\001\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\016\001\255\255\255\255\019\001\
\020\001\021\001\255\255\010\001\024\001\012\001\255\255\014\001\
\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\
\255\255\024\001\255\255\026\001\027\001\010\001\255\255\012\001\
\255\255\014\001\015\001\016\001\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\024\001\255\255\026\001\027\001\010\001\
\255\255\012\001\255\255\014\001\015\001\016\001\017\001\018\001\
\019\001\020\001\021\001\022\001\255\255\024\001\255\255\026\001\
\027\001\010\001\255\255\012\001\255\255\014\001\015\001\016\001\
\017\001\018\001\019\001\020\001\021\001\022\001\255\255\024\001\
\255\255\026\001\027\001\010\001\255\255\012\001\255\255\014\001\
\015\001\255\255\017\001\018\001\019\001\020\001\021\001\022\001\
\255\255\255\255\255\255\026\001\027\001\010\001\255\255\012\001\
\255\255\014\001\015\001\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\255\255\255\255\026\001\027\001\010\001\
\255\255\012\001\255\255\014\001\015\001\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\255\255\255\255\255\255\026\001\
\027\001\010\001\255\255\012\001\255\255\014\001\015\001\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\255\255\255\255\
\255\255\026\001\027\001\010\001\255\255\012\001\255\255\014\001\
\015\001\255\255\017\001\018\001\019\001\020\001\021\001\022\001\
\255\255\255\255\255\255\026\001\027\001\010\001\255\255\012\001\
\255\255\014\001\015\001\255\255\017\001\018\001\019\001\020\001\
\021\001\022\001\255\255\255\255\255\255\026\001\027\001\010\001\
\255\255\012\001\255\255\014\001\015\001\255\255\017\001\018\001\
\255\255\255\255\255\255\022\001\255\255\255\255\255\255\026\001\
\027\001\010\001\255\255\012\001\255\255\014\001\015\001\255\255\
\017\001\018\001\255\255\255\255\255\255\022\001\255\255\255\255\
\255\255\026\001\027\001\010\001\255\255\012\001\255\255\014\001\
\015\001\255\255\017\001\018\001\255\255\255\255\255\255\022\001\
\255\255\255\255\255\255\026\001\027\001\010\001\255\255\012\001\
\255\255\014\001\015\001\255\255\017\001\018\001\255\255\255\255\
\255\255\022\001\255\255\255\255\255\255\026\001\027\001\010\001\
\255\255\012\001\255\255\014\001\015\001\255\255\017\001\018\001\
\255\255\255\255\255\255\022\001\255\255\255\255\255\255\026\001\
\027\001\010\001\255\255\012\001\255\255\014\001\015\001\255\255\
\017\001\018\001\255\255\255\255\255\255\022\001\255\255\255\255\
\255\255\026\001\027\001\010\001\255\255\012\001\255\255\014\001\
\015\001\255\255\017\001\018\001\255\255\255\255\255\255\022\001\
\255\255\255\255\255\255\026\001\027\001\010\001\255\255\012\001\
\255\255\014\001\015\001\255\255\017\001\018\001\255\255\255\255\
\255\255\022\001\255\255\255\255\255\255\026\001\027\001\010\001\
\255\255\012\001\255\255\014\001\015\001\255\255\017\001\018\001\
\255\255\255\255\255\255\022\001\255\255\255\255\255\255\026\001\
\027\001\010\001\255\255\012\001\255\255\014\001\015\001\255\255\
\017\001\018\001\255\255\255\255\255\255\022\001\255\255\255\255\
\255\255\026\001\027\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIV\000\
  LPAREN\000\
  RPAREN\000\
  LBRACES\000\
  RBRACES\000\
  LBKT\000\
  RBKT\000\
  COMMA\000\
  DOT\000\
  MOD\000\
  SEMICOLON\000\
  EQUALITY\000\
  LESS\000\
  MORE\000\
  EOL\000\
  DIM\000\
  ANGLE\000\
  IF\000\
  THEN\000\
  ELSE\000\
  ASSIGN\000\
  FOR\000\
  WHILE\000\
  "

let yynames_block = "\
  INT\000\
  FLOAT\000\
  BOOL\000\
  VAR\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 26 "parser.mly"
                            ( Ast.eval _1 )
# 456 "parser.ml"
               : Ast.exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 29 "parser.mly"
                              ( _2 )
# 463 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 30 "parser.mly"
                              ( Ast.eval (Ast.Intex _1) )
# 470 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 31 "parser.mly"
                            ( Ast.eval (Ast.Fltex _1) )
# 477 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 32 "parser.mly"
                            ( Ast.eval (Ast.Boolex _1) )
# 484 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 33 "parser.mly"
                            ( Ast.eval (Ast.Varex _1) )
# 491 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "parser.mly"
                              ( Ast.eval (Ast.Dotprodex (_1, _3)) )
# 499 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "parser.mly"
                              ( Ast.eval (Ast.Addex (_1, _3)) )
# 507 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "parser.mly"
                              ( Ast.eval (Ast.Subex(_1, _3)) )
# 515 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "parser.mly"
                              ( Ast.eval (Ast.Mulex(_1, _3)) )
# 523 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "parser.mly"
                              ( Ast.eval (Ast.Divex(_1, _3)) )
# 531 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "parser.mly"
                              ( (Ast.Equex(_1,_3)) )
# 539 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 40 "parser.mly"
                              ( (Ast.Lessex(_1, _3)) )
# 547 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 41 "parser.mly"
                              ( (Ast.Morex(_1, _3)) )
# 555 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 42 "parser.mly"
                              ( Ast.eval (Ast.Magex _2) )
# 562 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 43 "parser.mly"
                              ( Ast.eval (Ast.Subex(Ast.Fltex 0., _2)) )
# 569 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 44 "parser.mly"
                              ( Ast.eval (Ast.Anglex(_1,_3)) )
# 577 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 45 "parser.mly"
                              ( Ast.eval (Ast.Dimex _2) )
# 584 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'elements) in
    Obj.repr(
# 46 "parser.mly"
                              ( Ast.eval (Ast.Vectex _2) )
# 591 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exprs) in
    Obj.repr(
# 47 "parser.mly"
                                        ( Ast.eval (Ast.Seqex _2))
# 598 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 48 "parser.mly"
                                        ( Ast.eval (Ast.Cndex(_2, _4, _6)))
# 607 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 49 "parser.mly"
                              ( Ast.eval (Ast.Letex (_1, _3)) )
# 615 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'cmd) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 50 "parser.mly"
                                                          ( Ast.eval (Ast.Forex(_3, _5, _7, _9)) )
# 625 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 51 "parser.mly"
                                                          ( Ast.eval (Ast.Forex(_3, _3, _5, Ast.Seqex [])) )
# 633 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 54 "parser.mly"
                            ( [Ast.eval _1] )
# 640 "parser.ml"
               : 'elements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'elements) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 55 "parser.mly"
                            ( _1 @ [Ast.eval _3] )
# 648 "parser.ml"
               : 'elements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 58 "parser.mly"
                            ( [Ast.eval _1] )
# 655 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exprs) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
                            ( _1 @ [Ast.eval _3] )
# 663 "parser.ml"
               : 'exprs))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cmd) in
    Obj.repr(
# 62 "parser.mly"
                             ( _2 )
# 670 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 63 "parser.mly"
                              ( (Ast.Intex _1) )
# 677 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : float) in
    Obj.repr(
# 64 "parser.mly"
                            ( (Ast.Fltex _1) )
# 684 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 65 "parser.mly"
                            ( (Ast.Boolex _1) )
# 691 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 66 "parser.mly"
                            ( (Ast.Varex _1) )
# 698 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 67 "parser.mly"
                            ( (Ast.Dotprodex (_1, _3)) )
# 706 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 68 "parser.mly"
                            ( (Ast.Addex (_1, _3)) )
# 714 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 69 "parser.mly"
                            ( (Ast.Subex(_1, _3)) )
# 722 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 70 "parser.mly"
                            ( (Ast.Mulex(_1, _3)) )
# 730 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 71 "parser.mly"
                            ( (Ast.Divex(_1, _3)) )
# 738 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 72 "parser.mly"
                            ( (Ast.Equex(_1,_3)) )
# 746 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 73 "parser.mly"
                            ( (Ast.Lessex(_1, _3)) )
# 754 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 74 "parser.mly"
                            ( (Ast.Morex(_1, _3)) )
# 762 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cmd) in
    Obj.repr(
# 75 "parser.mly"
                             ( (Ast.Magex _2) )
# 769 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 76 "parser.mly"
                             ( (Ast.Subex(Ast.Fltex 0., _2)) )
# 776 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 77 "parser.mly"
                             ( (Ast.Anglex(_1,_3)) )
# 784 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 78 "parser.mly"
                             ( (Ast.Dimex _2) )
# 791 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cmdelements) in
    Obj.repr(
# 79 "parser.mly"
                                 ( (Ast.Vectex _2) )
# 798 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'cmds) in
    Obj.repr(
# 80 "parser.mly"
                                       ( (Ast.Seqex _2))
# 805 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'cmd) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 81 "parser.mly"
                                     ( (Ast.Cndex(_2, _4, _6)))
# 814 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 82 "parser.mly"
                             ( (Ast.Letex (_1, _3)) )
# 822 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'cmd) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 83 "parser.mly"
                                                          ( (Ast.Forex(_3, _5, _7, _9)) )
# 832 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 84 "parser.mly"
                                                          ( (Ast.Forex(_3, _3, _5, Ast.Seqex [])) )
# 840 "parser.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 87 "parser.mly"
                              ( [_1] )
# 847 "parser.ml"
               : 'cmdelements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmdelements) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 88 "parser.mly"
                              ( _1 @ [_3] )
# 855 "parser.ml"
               : 'cmdelements))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 90 "parser.mly"
                          ( [_1] )
# 862 "parser.ml"
               : 'cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmds) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 91 "parser.mly"
                          ( _1 @ [_3] )
# 870 "parser.ml"
               : 'cmds))
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
