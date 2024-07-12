import nim_math_tools/inner_type
import nim_math_tools/shape
import nim_math_tools/zeros
import std/unittest

test "zeros":
  check zeros(3) == @[0.0, 0.0, 0.0]
  check zeros(@[3]) == @[0.0, 0.0, 0.0]
  check zeros(@[2, 3]) == @[@[0.0, 0.0, 0.0], @[0.0, 0.0, 0.0]]
  check inner_type(zeros(@[2, 3, 4])) is float
  check shape(zeros(@[2, 3, 4])) == @[2, 3, 4]
