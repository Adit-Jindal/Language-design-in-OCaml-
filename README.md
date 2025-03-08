# Language design in OCaml

This contains the following operations:
### Integers and Floats:
- a+b - Addition
- a-b - Subtraction
- a*b - Multiplication
- a/b - Division
- a==b - Equality comparator
- a&lt;b - Checks if a is less than b
- a&gt;b - Checks if a is greater than b
### Vectors:
- v+u - vector addition
- v-u - vector subtraction
- k*v - scalar multiplication (vector is not one of booleans)
- v*k - scalar multiplication (vector is not one of booleans)
- v.u - dot product
- |v| - magnitude (non-boolean vector)
- dim v - dimensions
- v^u - angle between vectors (non-boolean vector)
- v==u - Equality comparator
- v&lt;u - Compares v and u lexicographically. Thus, v and u can be int, float, boolean, vector, or matrix.
- v&gt;u - Compares v and u lexicographically. Thus, v and u can be int, float, boolean, vector, or matrix.

Vectors having elements of different data types are permitted, and can work for certain operations.
### Booleans:
t stands for true, and f for false
- a+b - OR
- a-b - OR after negation ( = a OR (NOT b) )
- a*b - AND
- -a - NOT (executed via subtraction, equivalent to false-a)
### Matrices:
- k*m - scalar multiplication
- m+n - matrix addition
- m-n - matrix subtraction
- |m| - determinant of matrix
### Variables
Variables need to be assigned using ":=".
Assignment commands print output presenting the evaluated expression.
e.g., `VAR:=2+3` has the output "VAR=5".

All variable names consist of only upper case Latin characters.
Once declared, they can be used to replace any other data type.
e.g., `{A:=3; A+4}` evaluates to output "A=3 7"

In case of multiple assignments to the same variable name, the latest definition is updated and used.
### Sequencing:
Multiple expressions can be entered at once, separated by a semicolon ';', and enclosed in braces `{}`.

Outputs to such expressions are printed in a line, separated by spaces.

The last argument must not be followed by a semicolon.
e.g. `{4+3;3+2}` is valid, and gives out "7 5 "
     `{4+3;3+2;}` is not valid.
     
Blocks of commands may be grouped together using braces { }.
e.g. `{{3+4;2/3};33-2;{1/2}}` is valid, and outputs "7 0 31 0 ".

### Boolean checkers:
- a==b - true if a and b are the same expressions, else false
- a>b - true if a and b are int or float expressions, and a>b
- a&lt;b - true if a and b are int or float expressions, and a&lt;b

Comparison is carried out lexicographically, as per ASCII notation for the expression type defined in the Abstract Syntax Tree. Hence, the order followed is:

Matrices > Vectors > Int=Float > true > false


### For loop:
Syntax is `for("initialisation","conditions","updations")"steps"`

All parts in the syntax must be Sequence expressions, i.e., enclosed in braces, even if it contains a single expression inside it.

### Conditionals:
Conditional statements can be passed with the following syntax:
`if _ then _ else _`

e.g., in `if a then b else c`, if a evaluates to true, then b is executed, else c is carried out.
