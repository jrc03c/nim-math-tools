import argmin

let empty_ints: seq[int] = @[]
let empty_floats: seq[float] = @[]
let empty_strings: seq[string] = @[]

assert argmin(empty_ints) == -1
assert argmin(empty_floats) == -1
assert argmin(empty_strings) == -1

assert argmin(@[1, 2, 3]) == 0
assert argmin(@[10, -10, 0]) == 1
assert argmin(@[234, 233, 231]) == 2
assert argmin(@[234, 234, 234]) == 0

assert argmin(@[123.123, 456.456, 789.789]) == 0
assert argmin(@[456.456, 789.789, 123.123]) == 2
assert argmin(@[789.789, 123.123, 456.456]) == 1

assert argmin(@["abc", "def", "ghi", "jkl", "mno"]) == 0
assert argmin(@["mno", "jkl", "ghi", "def", "abc"]) == 4
assert argmin(@["mno", "jkl", "abc", "ghi", "def"]) == 2
