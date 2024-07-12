import nim_math_tools/count
import std/unittest

test "count":
  let x = @["a", "b", "c", "a", "b", "a", "a", "a"]
  check count(x)["a"] == 5
  check count(x)["b"] == 2
  check count(x)["c"] == 1

  let y = @[@[@[1, 1], @[2, 2], @[3, 3, 3, 3]]]
  check count(y)[1] == 2
  check count(y)[2] == 2
  check count(y)[3] == 4
