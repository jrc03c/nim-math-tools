import nim_math_tools/inner_type
import nim_math_tools/random
import std/unittest

test "inner_type":
  check inner_type(@[2, 3, 4]) is int
  check inner_type(@[@[@["foo", "bar"]]]) is string
  check inner_type(random(@[2, 3, 4, 5])) is float
