import nim_math_tools/set
import std/unittest

test "set":
  check set(@[2, 2, 2, 3, 4]) == @[2, 3, 4]
  check set(@[4, 4, 4, 3, 2]) == @[4, 3, 2]

  check set(@[@["a", "b", "c"], @["d", "e", "f"]]) == @["a", "b", "c", "d", "e", "f"]

  check set(@[@[1.2, 1.2, 1.2], @[6.7, 3.4, 3.4]]) == @[1.2, 6.7, 3.4]
