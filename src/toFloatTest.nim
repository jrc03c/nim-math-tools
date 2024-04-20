import std/math
import toFloat

assert toFloat(0) == 0.0
assert toFloat(1) == 1.0
assert toFloat(-1) == -1.0
assert toFloat(234.567) == 234.567
assert toFloat("-234.567") == -234.567
assert toFloat(true) == 1.0
assert toFloat(false) == 0.0
assert toFloat(@[2, 3, 4]) == @[2.0, 3.0, 4.0]

assert toFloat(@[@[-5, -6, -7], @[-8, -9, -10]]) == @[@[-5.0, -6.0, -7.0], @[
    -8.0, -9.0, -10.0]]

assert toFloat(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1.0, 0.0]]]]]

assert isNaN(toFloat("nope"))

for v in toFloat(@["a", "b", "c"]):
  assert isNaN(v)

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

assert isNaN(float("nope"))

for v in float(@["a", "b", "c"]):
  assert isNaN(v)
