import nim_math_tools/max
import std/unittest

test "max":
  check max(123.456, 789.012) == 789.012
  check max(-789.012, -123.456) == -123.456
  check max(123.456, 234) == 234
  check max(-234, 123.456) == 123.456

  let empty_ints: seq[int] = @[]
  let empty_floats: seq[float] = @[]

  check max(empty_ints) == low(int)
  check max(empty_floats) == low(float)

  check max(@[@[@[20, 30, 10]]]) == 30
  check max(@[@[@[-123.456, 123.456]]]) == 123.456
