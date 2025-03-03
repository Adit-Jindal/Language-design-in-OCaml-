# Language design in OCaml

This contains the following operations:
Integers and Floats:
- a+b - Addition
- a-b - Subtraction
- a*b - Multiplication
- a/b - Division

Vectors:
- v+u - vector addition
- v-u - vector subtraction
- k*v - scalar multiplication (scalar comes first) (vector is not one of booleans)
- v.u - dot product
- |v| - magnitude (non-boolean vector)
- dim v - dimensions
- v^u - angle between vectors (non-boolean vector)

Booleans:
T stands for true, and F for false
- a+b - OR
- a-b - OR after negation ( = a OR (NOT b) )
- a*b - AND
- -a - NOT (executed via subtraction, equivalent to F-a)

Matrices:
- k*m - scalar multiplication
- m+n - matrix addition
- m-n - matrix subtraction
- |m| - determinant of matrix
