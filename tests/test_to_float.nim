import nim_math_tools/to_float
import std/math
import std/unittest

test "to_float":
  check to_float(0) == 0.0
  check to_float(1) == 1.0
  check to_float(-1) == -1.0
  check to_float(234.567) == 234.567
  check to_float("-234.567") == -234.567
  check to_float(true) == 1.0
  check to_float(false) == 0.0
  check to_float(@[2, 3, 4]) == @[2.0, 3.0, 4.0]

  check to_float(@[@[-5, -6, -7], @[-8, -9, -10]]) == @[@[-5.0, -6.0, -7.0], @[
      -8.0, -9.0, -10.0]]

  check to_float(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1.0, 0.0]]]]]

  check is_nan(to_float("nope"))

  for v in to_float(@["a", "b", "c"]):
    check is_nan(v)

  check float(0) == 0.0
  check float(1) == 1.0
  check float(-1) == -1.0
  check float(234.567) == 234.567
  check float("-234.567") == -234.567
  check float(true) == 1.0
  check float(false) == 0.0
  check float(@[2, 3, 4]) == @[2.0, 3.0, 4.0]

  check float(@[@[-5, -6, -7], @[-8, -9, -10]]) == @[@[-5.0, -6.0, -7.0], @[
      -8.0, -9.0, -10.0]]

  check float(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1.0, 0.0]]]]]

  check is_nan(float("nope"))

  for v in float(@["a", "b", "c"]):
    check is_nan(v)
