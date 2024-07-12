import nim_math_tools/argmax
import std/unittest

test "argmax":
  let empty_ints: seq[int] = @[]
  let empty_floats: seq[float] = @[]
  let empty_strings: seq[string] = @[]

  check argmax(empty_ints) == -1
  check argmax(empty_floats) == -1
  check argmax(empty_strings) == -1

  check argmax(@[1, 2, 3]) == 2
  check argmax(@[-10, 10, 0]) == 1
  check argmax(@[234, 233, 231]) == 0
  check argmax(@[234, 234, 234]) == 0

  check argmax(@[123.123, 456.456, 789.789]) == 2
  check argmax(@[123.123, 789.789, 456.456]) == 1
  check argmax(@[789.789, 123.123, 456.456]) == 0

  check argmax(@["abc", "def", "ghi", "jkl", "mno"]) == 4
  check argmax(@["mno", "jkl", "ghi", "def", "abc"]) == 0
  check argmax(@["abc", "jkl", "mno", "ghi", "def"]) == 2
