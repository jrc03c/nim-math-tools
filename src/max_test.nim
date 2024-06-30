from math import is_na_n
import max

assert max(true, true) == true
assert max(true, false) == true
assert max(false, true) == true
assert max(false, false) == false
assert max(5, true) == 5
assert max(true, 5) == 5
assert max(-5, false) == 0
assert max(false, -5) == 0
assert max(-234, true) == 1
assert max(-234, false) == 0
assert max(123.456, 789.012) == 789.012
assert max(-789.012, -123.456) == -123.456
assert max(123.456, true) == 123.456
assert max(true, -123.456) == 1
assert max(-123.456, false) == 0.0
assert max(false, 123.456) == 123.456
assert max(123.456, 234) == 234
assert max(-234, 123.456) == 123.456
assert max("abc", "def") == "def"
assert max("def", "abc") == "def"

let empty_bools: seq[bool] = @[]
let empty_ints: seq[int] = @[]
let empty_floats: seq[float] = @[]
let empty_strings: seq[string] = @[]

assert max(empty_bools) == false
assert max(empty_ints) == 0
assert is_na_n(max(empty_floats))
assert max(empty_strings) == ""

assert max(@[@[@[true, false, true]]]) == true
assert max(@[@[@[20, 30, 10]]]) == 30
assert max(@[@[@[-123.456, 123.456]]]) == 123.456
assert max(@[@[@["b", "a", "c"]]]) == "c"
