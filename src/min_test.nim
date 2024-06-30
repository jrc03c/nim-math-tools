from math import is_na_n
import min

assert min(true, true) == true
assert min(true, false) == false
assert min(false, true) == false
assert min(false, false) == false
assert min(5, true) == 1
assert min(true, 5) == 1
assert min(5, false) == 0
assert min(false, 5) == 0
assert min(-234, true) == -234
assert min(-234, false) == -234
assert min(123.456, 789.012) == 123.456
assert min(-789.012, -123.456) == -789.012
assert min(123.456, true) == 1
assert min(true, 123.456) == 1
assert min(-123.456, false) == -123.456
assert min(false, -123.456) == -123.456
assert min(123.456, 234) == 123.456
assert min(-234, 123.456) == -234
assert min("abc", "def") == "abc"
assert min("def", "abc") == "abc"

let empty_bools: seq[bool] = @[]
let empty_ints: seq[int] = @[]
let empty_floats: seq[float] = @[]
let empty_strings: seq[string] = @[]

assert min(empty_bools) == false
assert min(empty_ints) == 0
assert is_na_n(min(empty_floats))
assert min(empty_strings) == ""

assert min(@[@[@[true, false, true]]]) == false
assert min(@[@[@[20, 30, 10]]]) == 10
assert min(@[@[@[-123.456, 123.456]]]) == -123.456
assert min(@[@[@["b", "a", "c"]]]) == "a"
