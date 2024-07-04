import is_jagged
import normal
import random
import std/sequtils

let a = normal(100)
assert is_jagged(a) == false

let b = @[@[2], @[3, 4], @[5, 6, 7]]
assert is_jagged(b) == true

let c = normal(@[2, 3, 4, 5])
assert is_jagged(c) == false

var d = normal(@[2, 3, 4, 5])
d[0][0][0].delete(0)
assert is_jagged(d) == true
