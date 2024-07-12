import nim_math_tools/factorial
import std/unittest

test "factorial":
  check factorial(0) == 1
  check factorial(1) == 1
  check factorial(2) == 2
  check factorial(3) == 6
  check factorial(4) == 24
  check factorial(5) == 120
  check factorial(5.0) == 120.0
  check factorial(5.9) == 120.0
