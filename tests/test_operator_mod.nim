import nim_math_tools/operator_approx
import nim_math_tools/operator_mod
import std/unittest

test "operator_mod":
  check 9 % 2 == 1
  check 9 % 3 == 0
  check 9 % 5 == 4
  check @[5, 10, 15] % 3 == @[2, 1, 0]
  check @[5, 10, 15] % @[2, 3, 4] == @[1, 1, 3]
  check 2.3 % 1.2 ~ 1.1
  check @[@[@[5, 10, 15]]] % @[@[@[2, 3, 4]]] == @[@[@[1, 1, 3]]]
