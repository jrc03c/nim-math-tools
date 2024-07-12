import nim_math_tools/identity
import nim_math_tools/shape
import std/unittest

test "identity":
  check identity(3) == @[@[1.0, 0.0, 0.0], @[0.0, 1.0, 0.0], @[0.0, 0.0, 1.0]]
  check identity(3, int) == @[@[1, 0, 0], @[0, 1, 0], @[0, 0, 1]]
  check shape(identity(5)) == @[5, 5]
  check eye(7) == identity(7)
