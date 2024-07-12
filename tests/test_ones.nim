import nim_math_tools/inner_type
import nim_math_tools/ones
import nim_math_tools/shape
import std/unittest

test "ones":
  check ones(3) == @[1.0, 1.0, 1.0]
  check ones(@[3]) == @[1.0, 1.0, 1.0]
  check ones(@[2, 3]) == @[@[1.0, 1.0, 1.0], @[1.0, 1.0, 1.0]]
  check inner_type(ones(@[2, 3, 4])) is float
  check shape(ones(@[2, 3, 4])) == @[2, 3, 4]
