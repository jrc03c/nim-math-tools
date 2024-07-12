import nim_math_tools/inner_type
import nim_math_tools/ndarray
import nim_math_tools/shape
import std/unittest

test "ndarray":
  check ndarray(3) == @[0.0, 0.0, 0.0]
  check ndarray(3, int) == @[0, 0, 0]
  check ndarray(3, string) == @["", "", ""]
  check ndarray(3) == ndarray(@[3])
  check inner_type(ndarray(@[2, 3, 4], bool)) is bool
  check shape(ndarray(@[2, 3, 4])) == @[2, 3, 4]
