import nim_math_tools/operator_approx
import nim_math_tools/pow
import std/unittest

test "pow":
  check pow(2, 3) == 8
  check pow(4, 3) == 64
  check pow(2.0, 3.0) == 8.0
  check pow(1.2, 3.4) ~ 1.858729692
  check pow(@[2, 3, 4], 3) == @[8, 27, 64]
  check pow(@[@[@[2, 3, 4]]], @[@[@[5, 6, 7]]]) == @[@[@[32, 729, 16384]]]
