from math import isNaN
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

let emptyBools: seq[bool] = @[]
let emptyInts: seq[int] = @[]
let emptyFloats: seq[float] = @[]
let emptyStrings: seq[string] = @[]

assert min(emptyBools) == false
assert min(emptyInts) == 0
assert isNaN(min(emptyFloats))
assert min(emptyStrings) == ""

assert min(@[@[@[true, false, true]]]) == false
assert min(@[@[@[20, 30, 10]]]) == 10
assert min(@[@[@[-123.456, 123.456]]]) == -123.456
assert min(@[@[@["b", "a", "c"]]]) == "a"
