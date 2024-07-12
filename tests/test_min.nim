import nim_math_tools/min
import std/unittest

test "min":
  check min(123.456, 789.012) == 123.456
  check min(-789.012, -123.456) == -789.012
  check min(123.456, 234) == 123.456
  check min(-234, 123.456) == -234

  let empty_ints: seq[int] = @[]
  let empty_floats: seq[float] = @[]

  check min(empty_ints) == high(int)
  check min(empty_floats) == high(float)

  check min(@[@[@[20, 30, 10]]]) == 10
  check min(@[@[@[-123.456, 123.456]]]) == -123.456
