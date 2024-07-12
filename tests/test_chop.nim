import nim_math_tools/chop
import std/unittest

test "chop":
  check chop(0.00000000000000001) == 0.0
  check chop(-0.00000000000000001) == 0.0
  check chop(0.01) == 0.01
  check chop(-0.01) == -0.01

  check chop(@[0.00000000000000001, 0.01, 0.1, 1.0, 10.0]) == @[0.0, 0.01, 0.1,
      1.0, 10.0]

  check chop(@[@[@[-1.0, 0.0, 1.0]]]) == @[@[@[-1.0, 0.0, 1.0]]]
  check chop(0.01, 0.1) == 0.0
