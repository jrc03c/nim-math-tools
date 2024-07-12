import nim_math_tools/apply
import std/unittest

test "apply":
  check apply(@[2, 3, 4], proc(v: int): float = float(v)) == @[2.0, 3.0, 4.0]

  check apply(@[@[2, 3], @[4, 5]], proc(v: int): int = v * 2) == @[@[4, 6], @[8, 10]]

