import nim_math_tools/min
import nim_math_tools/max
import nim_math_tools/normal
import nim_math_tools/shape
import std/unittest

test "normal":
  check typeof(normal()) is float
  check max(normal(1000)) >= 0.0
  check min(normal(1000)) <= 0.0
  check shape(normal(@[2, 3, 4])) == @[2, 3, 4]
