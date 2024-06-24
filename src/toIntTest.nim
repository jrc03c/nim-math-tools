import toInt

assert toInt(0.0) == 0
assert toInt(1.0) == 1
assert toInt(-1.0) == -1
assert toInt(234.567) == 235
assert toInt("-234") == -234
assert toInt(true) == 1
assert toInt(false) == 0
assert toInt(@[2.0, 3.0, 4.0]) == @[2, 3, 4]

assert toInt(@[@[-5.0, -6.0, -7.0], @[
    -8.0, -9.0, -10.0]]) == @[@[-5, -6, -7], @[-8, -9, -10]]

assert toInt(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1, 0]]]]]

var failed = false

try:
  discard toInt("nope")

except Exception:
  failed = true

assert failed

assert int(0.0) == 0
assert int(1.0) == 1
assert int(-1.0) == -1
assert int(234.567) == 235
assert int("-234") == -234
assert int(true) == 1
assert int(false) == 0
assert int(@[2.0, 3.0, 4.0]) == @[2, 3, 4]

assert int(@[@[-5.0, -6.0, -7.0], @[
    -8.0, -9.0, -10.0]]) == @[@[-5, -6, -7], @[-8, -9, -10]]

assert int(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1, 0]]]]]

failed = false

try:
  discard int("nope")

except Exception:
  failed = true

assert failed
