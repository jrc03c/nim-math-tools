import nim_math_tools/to_int
import std/unittest

test "to_int":
  check to_int(0.0) == 0
  check to_int(1.0) == 1
  check to_int(-1.0) == -1
  check to_int(234.567) == 235
  check to_int("-234") == -234
  check to_int(true) == 1
  check to_int(false) == 0
  check to_int(@[2.0, 3.0, 4.0]) == @[2, 3, 4]

  check to_int(@[@[-5.0, -6.0, -7.0], @[-8.0, -9.0, -10.0]]) == @[@[-5, -6, -7],
      @[-8, -9, -10]]

  check to_int(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1, 0]]]]]

  var failed = false

  try:
    discard to_int("nope")

  except CatchableError:
    failed = true

  check failed

  check int(0.0) == 0
  check int(1.0) == 1
  check int(-1.0) == -1
  check int(234.567) == 235
  check int("-234") == -234
  check int(true) == 1
  check int(false) == 0
  check int(@[2.0, 3.0, 4.0]) == @[2, 3, 4]

  check int(@[@[-5.0, -6.0, -7.0], @[-8.0, -9.0, -10.0]]) == @[@[-5, -6, -7], @[
      -8, -9, -10]]

  check int(@[@[@[@[@[true, false]]]]]) == @[@[@[@[@[1, 0]]]]]

  failed = false

  try:
    discard int("nope")

  except CatchableError:
    failed = true

  check failed
