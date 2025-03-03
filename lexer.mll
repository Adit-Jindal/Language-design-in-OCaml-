{
open Parser        (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
    [' ' '\t']     { token lexbuf }     (* skip blanks *)
    | ['\n' ]        { EOL }
    | ['0'-'9']+ as lxm { INT(int_of_string lxm) }
    | ['0'-'9']+ '.' ['0'-'9']* as lxm { FLOAT(float_of_string lxm) }
    | 'T'            { BOOL (true) }
    | 'F'            { BOOL (false) }
    | '+'            { PLUS }
    | '-'            { MINUS }
    | '*'            { TIMES }
    | '.'            { DOT }
    | '/'            { DIV }
    | '|'            { MOD }
    | ['d']['i']['m']{ DIM }
    | '^'            { ANGLE }
    | '('            { LPAREN }
    | ')'            { RPAREN }
    | '['            { LBKT }
    | ']'            { RBKT }
    | ','            { COMMA }
    | eof            { raise Eof }