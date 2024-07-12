import nim_math_tools/mode
import std/unittest

test "mode":
  check mode(@[2, 3, 2, 3, 2, 2, 2, 4]) == @[2]
  check mode(@["foo", "bar", "bar", "baz"]) == @["bar"]
  check mode(@[@[2, 3], @[2, 3], @[2, 3], @[4, 5]]) == @[2, 3]
