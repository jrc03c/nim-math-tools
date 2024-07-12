import nim_math_tools/index_of
import std/unittest

test "index_of":
  check index_of(@[2, 3, 4, 5, 6], 4) == @[2]
  check index_of(@[@[2], @[3, 4], @[5, 6, 7]], 6) == @[2, 1]
  check index_of(@[2, 3, 4, 5, 6], proc(v: int): bool = v > 5) == @[4]

  check index_of(@[@[2], @[3, 4], @[5, 6, 7]], proc(v: int): bool = v > 5) == @[2, 1]
