# Language design in OCaml

This contains the following operations:
### Integers and Floats:
- a+b - Addition
- a-b - Subtraction
- a*b - Multiplication
- a/b - Division

### Vectors:
- v+u - vector addition
- v-u - vector subtraction
- k*v - scalar multiplication (scalar comes first) (vector is not one of booleans)
- v.u - dot product
- |v| - magnitude (non-boolean vector)
- dim v - dimensions
- v^u - angle between vectors (non-boolean vector)

### Booleans:
t stands for true, and f for false
- a+b - OR
- a-b - OR after negation ( = a OR (NOT b) )
- a*b - AND
- -a - NOT (executed via subtraction, equivalent to F-a)

### Matrices:
- k*m - scalar multiplication
- m+n - matrix addition
- m-n - matrix subtraction
- |m| - determinant of matrix

### Variables
Variables need to be assigned using ":=".
Assignment commands print output presenting the evaluated expression.
e.g., `VAR:=2+3` has the output "VAR=5".
All variable names consist of only upper case roman characters.
Once declared, they can be used to replace any other data type.
e.g., `A:=3; A+4` evaluates to output "A=3 7"

### Sequencing:
Multiple expressions can be entered at once, separated by a semicolon ';'.
Outputs to such expressions are printed in a line, separated by spaces.

The last argument must not be followed by a semicolon.
e.g. `4+3;3+2` is valid, and gives out "7 5 "
     `4+3;3+2;` is not valid.
     
Blocks of commands may be grouped together using braces { }.
e.g. `{3+4;2/3};33-2;{1/2}` is valid, and outputs "7 0 31 0 ".

### Conditionals:
Conditional statements can be passed with the following syntax:
`if _ then _ else _`

e.g., in `if a then b else c`, if a evaluaes to true, then b is executed, else c is carried out.
