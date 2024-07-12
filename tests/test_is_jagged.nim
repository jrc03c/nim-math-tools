import nim_math_tools/is_jagged
import nim_math_tools/normal
import nim_math_tools/random
import std/sequtils
import std/unittest

test "is_jagged":
  let a = normal(100)
  check is_jagged(a) == false

  let b = @[@[2], @[3, 4], @[5, 6, 7]]
  check is_jagged(b) == true

  let c = normal(@[2, 3, 4, 5])
  check is_jagged(c) == false

  var d = normal(@[2, 3, 4, 5])
  d[0][0][0].delete(0)
  check is_jagged(d) == true
