%token <int> INT
%token <float> FLOAT
%token <bool> BOOL
%token <string> VAR
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN LBRACES RBRACES
%token LBKT RBKT COMMA DOT MOD SEMICOLON
%token EOL DIM ANGLE
%token IF THEN ELSE
%token ASSIGN
%left SEMICOLON
%left ASSIGN
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
    | expr PLUS expr          { Ast.eval (Ast.Addex ($1, $3)) }
    | expr MINUS expr         { Ast.eval (Ast.Subex($1, $3)) }
    | expr TIMES expr         { Ast.eval (Ast.Mulex($1, $3)) }
    | expr DOT expr           { Ast.eval (Ast.Dotprodex ($1, $3)) }
    | MOD expr MOD            { Ast.eval (Ast.Magex $2) }
    | expr DIV expr           { Ast.eval (Ast.Divex($1, $3)) }
    | MINUS expr %prec UMINUS { Ast.eval (Ast.Subex(Ast.Fltex 0., $2)) }
    | expr ANGLE expr         { Ast.eval (Ast.Anglex($1,$3)) }
    | DIM expr                { Ast.eval (Ast.Dimex $2) }
    | LBKT elements RBKT      { Ast.eval (Ast.Vectex $2) }
    | expr SEMICOLON exprs    { Ast.eval (Ast.Seqex ($1::$3))}
    | LBRACES exprs RBRACES   { Ast.eval (Ast.Seqex $2) }
    | IF expr THEN expr ELSE expr       { Ast.eval (Ast.Cndex($2, $4, $6))}
    | VAR ASSIGN expr         { Ast.eval (Ast.Letex ($1, $3)) }
;
elements:
    expr                    { [Ast.eval $1] }
    | elements COMMA expr   { $1 @ [Ast.eval $3] }

exprs:
    expr                    { [Ast.eval $1] }
    | exprs SEMICOLON expr  { $1 @ [Ast.eval $3] }