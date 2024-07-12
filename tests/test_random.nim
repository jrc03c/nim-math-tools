import nim_math_tools/min
import nim_math_tools/max
import nim_math_tools/random
import nim_math_tools/shape
import std/unittest

test "random":
  check typeof(random()) is float
  check random() <= 1.0
  check random() >= 0.0
  check max(random(1000)) <= 1.0
  check min(random(1000)) >= 0.0
  check shape(random(@[2, 3, 4])) == @[2, 3, 4]
