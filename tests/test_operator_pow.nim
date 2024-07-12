import nim_math_tools/operator_approx
import nim_math_tools/operator_pow
import std/unittest

test "operator_pow":
  check 2 ** 3 == 8
  check 4 ** 3 == 64
  check 2.0 ** 3.0 == 8.0
  check 1.2 ** 3.4 ~ 1.858729692
  check @[2, 3, 4] ** 3 == @[8, 27, 64]
  check @[@[@[2, 3, 4]]] ** @[@[@[5, 6, 7]]] == @[@[@[32, 729, 16384]]]
