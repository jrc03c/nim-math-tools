import nim_math_tools/operator_range_seq
import std/unittest

test "operator_range_seq":
  check range_seq(10, 15) == @[10, 11, 12, 13, 14, 15]
  check range_seq(100, 200, 25) == @[100, 125, 150, 175, 200]
  check range_seq(100, 200, -25) == @[100, 125, 150, 175, 200]
  check range_seq(3, -3) == @[3, 2, 1, 0, -1, -2, -3]
  check range_seq(-10, -30, -5) == @[-10, -15, -20, -25, -30]
  check range_seq(-10, -30, 5) == @[-10, -15, -20, -25, -30]
  check range_seq(10, 10) == @[10]
  check range_seq(10, 100, 0) == @[10]

  check 10 ... 15 == @[10, 11, 12, 13, 14, 15]
  check 3 ... -3 == @[3, 2, 1, 0, -1, -2, -3]
  check 10 ... 10 == @[10]

  check (10 ... 15) == @[10, 11, 12, 13, 14, 15]
  check (3 ... -3) == @[3, 2, 1, 0, -1, -2, -3]
  check (10 ... 10) == @[10]
