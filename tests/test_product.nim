import nim_math_tools/operator_approx
import nim_math_tools/product
import std/unittest

test "product":
  check product(@[0]) == 0
  check product(@[5]) == 5
  check product(@[-5]) == -5
  check product(@[2, 3, 4]) == 24
  check product(@[2.0, 3.0, 4.0]) == 24.0
  check product(@[@[2.3, 4.5], @[6.7, 8.9]]) ~ 617.1705
