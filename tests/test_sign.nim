import nim_math_tools/sign
import std/unittest

test "sign":
  check sign(3) == 1
  check sign(-3) == -1
  check sign(0) == 0

  check sign(3.0) == 1.0
  check sign(-3.0) == -1.0
  check sign(0.0) == 0.0

  check sign(@[2, -3, 4, -5]) == @[1, -1, 1, -1]
  check sign(@[@[0.0, -2.0], @[4.0, -6.0]]) == @[@[0.0, -1.0], @[1.0, -1.0]]
