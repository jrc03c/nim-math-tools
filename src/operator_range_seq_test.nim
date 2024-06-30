import operator_range_seq

assert range_seq(10, 15) == @[10, 11, 12, 13, 14, 15]
assert range_seq(100, 200, 25) == @[100, 125, 150, 175, 200]
assert range_seq(100, 200, -25) == @[100, 125, 150, 175, 200]
assert range_seq(3, -3) == @[3, 2, 1, 0, -1, -2, -3]
assert range_seq(-10, -30, -5) == @[-10, -15, -20, -25, -30]
assert range_seq(-10, -30, 5) == @[-10, -15, -20, -25, -30]
assert range_seq(10, 10) == @[10]
assert range_seq(10, 100, 0) == @[10]

assert 10 ... 15 == @[10, 11, 12, 13, 14, 15]
assert 3 ... -3 == @[3, 2, 1, 0, -1, -2, -3]
assert 10 ... 10 == @[10]

assert (10 ... 15) == @[10, 11, 12, 13, 14, 15]
assert (3 ... -3) == @[3, 2, 1, 0, -1, -2, -3]
assert (10 ... 10) == @[10]
