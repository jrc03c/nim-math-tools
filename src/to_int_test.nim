import to_int

assert to_int(0.0) == 0
assert to_int(1.0) == 1
assert to_int(-1.0) == -1
assert to_int(234.567) == 235
assert to_int("-234") == -234
assert to_int(true) == 1
assert to_int(false) == 0
assert to_int(@[2.0, 3.0, 4.0]) == @[2, 3, 4]

assert to_int(@[@[-5.0, -6.0, -7.0], @[
    -8.0, -9.0, -10.0]]) == @[@[-5, -6, -7], @[-8, -9, -10]]

assert to_int(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1, 0]]]]]

var failed = false

try:
  discard to_int("nope")

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
