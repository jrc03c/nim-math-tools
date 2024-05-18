import argmax

let emptyInts: seq[int] = @[]
let emptyFloats: seq[float] = @[]
let emptyStrings: seq[string] = @[]

assert argmax(emptyInts) == -1
assert argmax(emptyFloats) == -1
assert argmax(emptyStrings) == -1

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
