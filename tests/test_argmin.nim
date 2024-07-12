import nim_math_tools/argmin
import std/unittest

test "argmin":
  let empty_ints: seq[int] = @[]
  let empty_floats: seq[float] = @[]
  let empty_strings: seq[string] = @[]

  check argmin(empty_ints) == -1
  check argmin(empty_floats) == -1
  check argmin(empty_strings) == -1

  check argmin(@[1, 2, 3]) == 0
  check argmin(@[10, -10, 0]) == 1
  check argmin(@[234, 233, 231]) == 2
  check argmin(@[234, 234, 234]) == 0

  check argmin(@[123.123, 456.456, 789.789]) == 0
  check argmin(@[456.456, 789.789, 123.123]) == 2
  check argmin(@[789.789, 123.123, 456.456]) == 1

  check argmin(@["abc", "def", "ghi", "jkl", "mno"]) == 0
  check argmin(@["mno", "jkl", "ghi", "def", "abc"]) == 4
  check argmin(@["mno", "jkl", "abc", "ghi", "def"]) == 2
