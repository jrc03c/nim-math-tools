import nim_math_tools/normal
import nim_math_tools/reshape
import nim_math_tools/shape
import std/unittest

test "reshape":
  let a = normal(100)
  let b = reshape(a, @[2, 5, 10])
  check shape(b) == @[2, 5, 10]

  let c = normal(@[2, 3, 4, 5])
  let d = reshape(c, @[5, 4, 3, 2])
  let e = reshape(c, @[2 * 3 * 4 * 5])
  check shape(d) == @[5, 4, 3, 2]
  check shape(e) == @[2 * 3 * 4 * 5]
