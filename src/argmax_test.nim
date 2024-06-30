import argmax

let empty_ints: seq[int] = @[]
let empty_floats: seq[float] = @[]
let empty_strings: seq[string] = @[]

assert argmax(empty_ints) == -1
assert argmax(empty_floats) == -1
assert argmax(empty_strings) == -1

assert argmax(@[1, 2, 3]) == 2
assert argmax(@[-10, 10, 0]) == 1
assert argmax(@[234, 233, 231]) == 0
assert argmax(@[234, 234, 234]) == 0

assert argmax(@[123.123, 456.456, 789.789]) == 2
assert argmax(@[123.123, 789.789, 456.456]) == 1
assert argmax(@[789.789, 123.123, 456.456]) == 0

assert argmax(@["abc", "def", "ghi", "jkl", "mno"]) == 4
assert argmax(@["mno", "jkl", "ghi", "def", "abc"]) == 0
assert argmax(@["abc", "jkl", "mno", "ghi", "def"]) == 2
