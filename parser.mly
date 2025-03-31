%token <int> INT
%token <float> FLOAT
%token <bool> BOOL
%token <string> VAR
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN LBRACES RBRACES UNDSC
%token LBKT RBKT COMMA DOT MOD SEMICOLON EQUALITY LESS MORE
%token EOL DIM ANGLE PRIME PRINT QUIT
%token IF THEN ELSE
%token ASSIGN FOR WHILE
%token <string> INPUT

%left PRINT
%left UNDSC
%left LPAREN RPAREN
%left IF THEN ELSE
%left SEMICOLON
%left ASSIGN
%left DIM
%left EQUALITY LESS MORE
%left DOT ANGLE
%left PRIME
%left PLUS MINUS        /* lowest precedence */
%left TIMES DIV         /* medium precedence */
%nonassoc UMINUS        /* highest precedence */
%start main             /* the entry point */
%type <Ast.exp> main
%%
main:
    expr EOL                { Ast.eval $1 }
;
expr:
    | LPAREN expr RPAREN      { $2 }
    | INT                     { Ast.eval (Ast.Intex $1) }
    | FLOAT                 { Ast.eval (Ast.Fltex $1) }
    | BOOL                  { Ast.eval (Ast.Boolex $1) }
    | VAR                   { Ast.eval (Ast.Varex $1) }
    | expr DOT expr           { Ast.eval (Ast.Dotprodex ($1, $3)) }
    | expr PLUS expr          { Ast.eval (Ast.Addex ($1, $3)) }
    | expr MINUS expr         { Ast.eval (Ast.Subex($1, $3)) }
    | expr TIMES expr         { Ast.eval (Ast.Mulex($1, $3)) }
    | expr DIV expr           { Ast.eval (Ast.Divex($1, $3)) }
    | expr EQUALITY expr      { (Ast.Equex($1,$3)) }
    | expr LESS expr          { (Ast.Lessex($1, $3)) }
    | expr MORE expr          { (Ast.Morex($1, $3)) }
    | MOD expr MOD            { Ast.eval (Ast.Magex $2) }
    | MINUS expr %prec UMINUS { Ast.eval (Ast.Subex(Ast.Fltex 0., $2)) }
    | expr ANGLE expr         { Ast.eval (Ast.Anglex($1,$3)) }
    | DIM expr                { Ast.eval (Ast.Dimex $2) }
    | LBKT elements RBKT      { Ast.eval (Ast.Vectex $2) }
    | LBKT expr SEMICOLON expr RBKT     { Ast.eval (Ast.Emptex ($2, $4)) }
    | LBRACES exprs RBRACES             { Ast.eval (Ast.Seqex $2)}
    | IF expr THEN expr ELSE expr       { Ast.eval (Ast.Cndex($2, $4, $6))}
    | VAR ASSIGN expr         { Ast.eval (Ast.Letex ($1, $3)) }
    | expr LPAREN expr COMMA expr RPAREN ASSIGN expr      { Ast.eval (Ast.AdMtex($1, $3, $5, $8)) }
    | expr LESS LESS expr COMMA expr MORE MORE    { Ast.eval (Ast.MtMinex ($1, $4, $6))}
    | FOR LPAREN expr COMMA cmd COMMA cmd RPAREN cmd      { Ast.eval (Ast.Forex($3, $5, $7, $9)) } //All will be Seqex 
    | WHILE LPAREN cmd RPAREN cmd                         { Ast.eval (Ast.Forex($3, $3, $5, Ast.Seqex [])) } //All will be Seqex
    | UNDSC expr UNDSC        { Ast.eval (Ast.Transex $2) }
    | expr PRIME              { Ast.eval (Ast.Invex $1) }
    | PRINT LPAREN expr RPAREN      { Ast.eval (Ast.Printex $3) }
    | INPUT                         { Ast.eval (Ast.Inputex $1) }
    | QUIT                          { Ast.Quitex }
;
elements:
    expr                    { [Ast.eval $1] }
    | elements COMMA expr   { $1 @ [Ast.eval $3] }

exprs:
    expr                    { [Ast.eval $1] }
    | exprs SEMICOLON expr  { $1 @ [Ast.eval $3] }
//------------------------------------------------------------
cmd:
    | LPAREN cmd RPAREN      { $2 }
    | INT                     { (Ast.Intex $1) }
    | FLOAT                 { (Ast.Fltex $1) }
    | BOOL                  { (Ast.Boolex $1) }
    | VAR                   { (Ast.Varex $1) }
    | cmd DOT cmd           { (Ast.Dotprodex ($1, $3)) }
    | cmd PLUS cmd          { (Ast.Addex ($1, $3)) }
    | cmd MINUS cmd         { (Ast.Subex($1, $3)) }
    | cmd TIMES cmd         { (Ast.Mulex($1, $3)) }
    | cmd DIV cmd           { (Ast.Divex($1, $3)) }
    | cmd EQUALITY cmd      { (Ast.Equex($1,$3)) }
    | cmd LESS cmd          { (Ast.Lessex($1, $3)) }
    | cmd MORE cmd          { (Ast.Morex($1, $3)) }
    | MOD cmd MOD            { (Ast.Magex $2) }
    | MINUS cmd %prec UMINUS { (Ast.Subex(Ast.Fltex 0., $2)) }
    | cmd ANGLE cmd          { (Ast.Anglex($1,$3)) }
    | DIM cmd                { (Ast.Dimex $2) }
    | LBKT cmdelements RBKT      { (Ast.Vectex $2) }
    | LBKT cmd SEMICOLON cmd RBKT      { (Ast.Emptex ($2, $4)) }
    | LBRACES cmds RBRACES             { (Ast.Seqex $2) }
    | IF cmd THEN cmd ELSE cmd         { (Ast.Cndex($2, $4, $6))}
    | VAR ASSIGN cmd         { (Ast.Letex ($1, $3)) }
    | cmd LPAREN cmd COMMA cmd RPAREN ASSIGN cmd     { (Ast.AdMtex($1, $3, $5, $8))}
    | cmd LESS LESS cmd COMMA cmd MORE MORE    { (Ast.MtMinex ($1, $4, $6))}
    | FOR LPAREN expr COMMA cmd COMMA cmd RPAREN cmd      { (Ast.Forex($3, $5, $7, $9)) } //All will be Seqex
    | WHILE LPAREN cmd RPAREN cmd                         { (Ast.Forex($3, $3, $5, Ast.Seqex [])) } //All will be Seqex
    | UNDSC cmd UNDSC        { (Ast.Transex $2) }
    | cmd PRIME              { (Ast.Invex $1) }
;
cmdelements:
    cmd                       { [$1] }
    | cmdelements COMMA cmd   { $1 @ [$3] }
cmds:
    cmd                   { [$1] }
    | cmds SEMICOLON cmd  { $1 @ [$3] }
