%token <int> INT
%token <float> FLOAT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN LBKT RBKT COMMA DOT MOD
%token EOL DIM ANGLE
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
    INT                     { Ast.Intex $1 }
    | FLOAT                 { Ast.Fltex $1 }
    | LPAREN expr RPAREN      { $2 }
    | expr PLUS expr          { Ast.Addex ($1, $3) }
    | expr MINUS expr         { Ast.Subex($1, $3) }
    | expr TIMES expr         { Ast.Mulex($1, $3) }
    | expr DOT expr           { Ast.Dotprodex ($1, $3) }
    | MOD expr MOD            { Ast.Magex $2 }
    | expr DIV expr           { Ast.Divex($1, $3) }
    | MINUS expr %prec UMINUS { Ast.Subex(Ast.Fltex 0., $2) }
    | expr ANGLE expr         { Ast.Anglex($1,$3) }
    | DIM expr                { Ast.Dimex $2 }
    | LBKT elements RBKT      { Ast.Vectex $2 }
;
elements:
    expr                    { [Ast.eval $1] }
    | elements COMMA expr   { $1 @ [Ast.eval $3] }