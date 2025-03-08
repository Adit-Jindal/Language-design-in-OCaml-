{
    open Parser        (*The type token is defined in parser.mli*)
    exception Eof
}

rule token = parse
    [' ' '\t']                          { token lexbuf }     (* skip blanks *)
    | ['\n' ]                           { EOL }
    | ['0'-'9']+ as lxm                 { INT(int_of_string lxm) }
    | ['0'-'9']+ '.' ['0'-'9']+ as lxm  { FLOAT(float_of_string lxm) }
    | ['A'-'Z']+ as lxm                 { VAR(lxm) }
    | 't'                               { BOOL (true) }
    | 'f'                               { BOOL (false) }
    | '+'                               { PLUS }
    | '-'                               { MINUS }
    | '*'                               { TIMES }
    | '.'                               { DOT }
    | '/'                               { DIV }
    | '|'                               { MOD }
    | ['d']['i']['m']                   { DIM }
    | '^'                               { ANGLE }
    | '('                               { LPAREN }
    | ')'                               { RPAREN }
    | '['                               { LBKT }
    | ']'                               { RBKT }
    | '{'                               { LBRACES }
    | '}'                               { RBRACES }
    | ','                               { COMMA }
    | ';'                               { SEMICOLON }
    | ['=']['=']                        { EQUALITY }
    | ['i']['f']                        { IF }
    | ['t']['h']['e']['n']              { THEN }
    | ['e']['l']['s']['e']              { ELSE }
    | [':']['=']                        { ASSIGN }
    | ['f']['o']['r']                   { FOR }
    | "///"                             { comment lexbuf }
    | ['w']['h']['i']['l']['e']         { WHILE }
    | '<'                               { LESS }
    | '>'                               { MORE }
    | eof                               { raise Eof }

and comment = parse
    "///"                             { token lexbuf }
    | _                                 { comment lexbuf }