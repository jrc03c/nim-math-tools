import std/math
import to_float

assert to_float(0) == 0.0
assert to_float(1) == 1.0
assert to_float(-1) == -1.0
assert to_float(234.567) == 234.567
assert to_float("-234.567") == -234.567
assert to_float(true) == 1.0
assert to_float(false) == 0.0
assert to_float(@[2, 3, 4]) == @[2.0, 3.0, 4.0]

assert to_float(@[@[-5, -6, -7], @[-8, -9, -10]]) == @[@[-5.0, -6.0, -7.0], @[
    -8.0, -9.0, -10.0]]

assert to_float(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1.0, 0.0]]]]]

assert is_na_n(to_float("nope"))

for v in to_float(@["a", "b", "c"]):
  assert is_na_n(v)

assert float(0) == 0.0
assert float(1) == 1.0
assert float(-1) == -1.0
assert float(234.567) == 234.567
assert float("-234.567") == -234.567
assert float(true) == 1.0
assert float(false) == 0.0
assert float(@[2, 3, 4]) == @[2.0, 3.0, 4.0]

assert float(@[@[-5, -6, -7], @[-8, -9, -10]]) == @[@[-5.0, -6.0, -7.0], @[
    -8.0, -9.0, -10.0]]

assert float(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1.0, 0.0]]]]]

assert is_na_n(float("nope"))

for v in float(@["a", "b", "c"]):
  assert is_na_n(v)
